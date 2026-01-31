<?php

namespace App\Http\Controllers\Patient;

use App\Http\Controllers\Controller;
use App\Models\Doctor;
use App\Models\Patient;
use App\Models\PatientIntake;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Http;
use Carbon\Carbon;

class IntakeformController extends Controller
{
    /**
     * Call OpenAI API for AI Triage
     */
    protected function callOpenAITriageApi(string $prompt, array $triageSchema): array
    {
        $apiKey = env('OPENAI_API_KEY');
        $apiUrl = "https://api.openai.com/v1/chat/completions";

        try {
            $response = Http::withHeaders([
                'Authorization' => 'Bearer ' . $apiKey,
                'Content-Type' => 'application/json',
            ])->post($apiUrl, [
                'model' => 'gpt-4o-mini', // ✅ Lightweight Omni model (fast + accurate)
                'messages' => [
                    [
                        'role' => 'system',
                        'content' => "You are an AI medical triage assistant.
                        Analyze the given patient data and respond strictly in this JSON format:
                        {
                            \"level\": 1-5,
                            \"color\": \"red/orange/yellow/green/blue\",
                            \"recommended_specialist\": \"string\",
                            \"description\": \"string\"
                        }.
                        Do not include any text outside this JSON structure.
                        
                        When selecting the \"recommended_specialist\", **you must prioritize one of the following predefined options** if they are relevant:
                        
                        [
                          \"General Physician\",
                          \"Cardiologist\",
                          \"Pulmonologist\",
                          \"Neurologist\",
                          \"Gastroenterologist\",
                          \"Dermatologist\",
                          \"Orthopedic Specialist\",
                          \"ENT Specialist\",
                          \"Psychiatrist\",
                          \"Gynecologist\",
                          \"Pediatrician\",
                          \"Ophthalmologist\",
                          \"Nephrologist\",
                          \"Urologist\",
                          \"Endocrinologist\",
                          \"Oncologist\",
                          \"Hematologist\",
                          \"Infectious Disease Specialist\",
                          \"Rheumatologist\",
                          \"Critical Care Specialist\",
                          \"Emergency Physician\",
                          \"Internal Medicine\",
                          \"Dentist\",
                        ].
                        
                        If **none of these** fit the patient’s symptoms or condition,
                        you may output another specialist name, but it must be **a real, valid medical specialty** (e.g., Dentist, Allergist, Plastic Surgeon, etc.).
                        
                        If unsure, default to \"General Physician\"."

                    ],
                    ['role' => 'user', 'content' => $prompt],
                ],
            ]);

            if ($response->failed()) {
                Log::error('OpenAI API Error', [
                    'status' => $response->status(),
                    'body' => $response->body(),
                ]);

                return [
                    'level' => 5,
                    'color' => 'blue',
                    'recommended_specialist' => 'General Physician / Telehealth (API Error)',
                    'description' => 'Could not perform AI triage. Defaulting to Level 5.',
                ];
            }

            $result = $response->json();
            $output = $result['choices'][0]['message']['content'] ?? '';

            // Extract clean JSON (remove any extra text)
            $jsonText = trim($output);
            $jsonText = preg_replace('/^[^{]+|[^}]+$/', '', $jsonText);
            $triageResult = json_decode($jsonText, true);

            if (isset($triageResult['level'], $triageResult['color'], $triageResult['recommended_specialist'])) {
                return $triageResult;
            }

            return [
                'level' => 5,
                'color' => 'blue',
                'recommended_specialist' => 'General Physician / Telehealth (Parse Error)',
                'description' => 'Could not parse AI triage result. Defaulting to Level 5.',
            ];
        } catch (\Throwable $e) {
            Log::error('OpenAI Exception', ['error' => $e->getMessage()]);

            return [
                'level' => 5,
                'color' => 'blue',
                'recommended_specialist' => 'General Physician / Telehealth (Exception)',
                'description' => 'An exception occurred during triage.',
            ];
        }
    }


    protected function runAITriage(array $data ): array
    {
        $user = Auth::user();
        $patient = Patient::where('user_id', $user->id)->first();


    $prompt = "Triage the following patient case.
        - Age: " . ($patient->age ?? 'Unknown') . "
        - Gender: " . ($patient->gender ?? 'Unknown') . "
        - Blood Group: " . ($patient->blood_group ?? 'Unknown') . "
        - Main Symptoms: " . ($data['symptoms'] ?? 'None') . "
        - Common Symptoms: " . implode(', ', $data['common_symptoms'] ?? []) . "
        - Condition Description: " . ($data['condition_description'] ?? 'None') . "
        - Vitals: Blood Pressure " . ($data['blood_pressure'] ?? 'N/A') . ", Temperature " . ($data['temperature'] ?? 'N/A') . "F, Heart Rate " . ($data['heart_rate'] ?? 'N/A') . " BPM.
        - Relevant History: " . implode(', ', $data['medical_history'] ?? []) . " " . ($data['other_history'] ?? '') . "
        - Pregnancy/Breastfeeding Status: Pregnancy: " . (($data['pregnancy_status'] ?? false) ? 'Yes' : 'No') . ", Breastfeeding: " . (($data['breast_feeding'] ?? false) ? 'Yes' : 'No') . "

        Provide the triage analysis strictly in JSON format (Level 1-5, color, specialist, description).";
        

        $triageSchema = [
            'type' => 'OBJECT',
            'properties' => [
                'level' => ['type' => 'INTEGER', 'description' => 'Triage urgency level from 1 (Red/Immediate) to 5 (Blue/Routine).'],
                'color' => ['type' => 'STRING', 'enum' => ['red', 'orange', 'yellow', 'green', 'blue']],
                'recommended_specialist' => ['type' => 'STRING', 'description' => 'The most appropriate specialist or service.'],
                'description' => ['type' => 'STRING', 'description' => 'A brief medical justification.'],
            ],
            'required' => ['level', 'color', 'recommended_specialist', 'description']
        ];


        return $this->callOpenAITriageApi($prompt, $triageSchema);
    }

    public function createform()
    {
        $userId = Auth::id();

        $patientData = DB::table('users')
            ->join('patients', 'patients.user_id', '=', 'users.id')
            ->select(
                'users.id as user_id',
                'users.name',
                'users.email',
                'users.dob',
                'patients.profile_image',
                'patients.phone',
                'patients.gender',
                'patients.age',
                'patients.blood_group'
            )
            ->where('users.id', $userId)
            ->first();

        $bpSuggestion = null;

        if ($patientData && $patientData->age && $patientData->gender) {
            $age = $patientData->age;
            $gender = $patientData->gender;

            if ($age >= 18 && $age <= 39) {
                $bpSuggestion = $gender === 'Female' ? 'Normal: 110/68 mm Hg' : 'Normal: 119/70 mm Hg';
            } elseif ($age >= 40 && $age <= 59) {
                $bpSuggestion = $gender === 'Female' ? 'Normal: 122/74 mm Hg' : 'Normal: 125/77 mm Hg';
            } elseif ($age >= 60) {
                $bpSuggestion = $gender === 'Female' ? 'Normal: 139/68 mm Hg' : 'Normal: 133/69 mm Hg';
            }
        }

        return view('Patient.intake_form', compact('patientData', 'bpSuggestion'));
    }

    /**
     * Store intake form submission
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'symptoms' => 'required|string',
            'common_symptoms' => 'nullable|array',
            'condition_description' => 'nullable|string',
            'blood_pressure' => 'nullable|string',
            'temperature' => 'nullable|numeric',
            'heart_rate' => 'nullable|numeric',
            'medical_history' => 'nullable|array',
            'other_history' => 'nullable|string',
            'pregnancy_status' => 'nullable|boolean',
            'breast_feeding' => 'nullable|boolean',
        ]);

        $userId = Auth::id();

        $patient = Patient::where('user_id', $userId)->first();

        if (!$patient) {
            return back()->withErrors(['patient_id' => 'Patient record not found for this user.']);
        }

        $triageResult = $this->runAITriage($validated);


        $intake = PatientIntake::create([
            'user_id' => $userId,
            'patient_id' => $patient->id,
            'symptoms' => $validated['symptoms'] ?? null,
            'common_symptoms' => isset($validated['common_symptoms']) ? json_encode($validated['common_symptoms']) : null,
            'condition_description' => $validated['condition_description'] ?? null,
            'blood_pressure' => $validated['blood_pressure'] ?? null,
            'temperature' => $validated['temperature'] ?? null,
            'heart_rate' => $validated['heart_rate'] ?? null,
            'medical_history' => isset($validated['medical_history']) ? json_encode($validated['medical_history']) : null,
            'other_history' => $validated['other_history'] ?? null,
            'pregnancy_status' => $validated['pregnancy_status'] ?? null,
            'breast_feeding' => $validated['breast_feeding'] ?? null,
            'urgency' => $triageResult['color'],
            'triage_level' => $triageResult['level'],
            'triage_description' => $triageResult['description'],
            'recommended_specialist' => $triageResult['recommended_specialist'],
        ]);

        return redirect()->route('patient.recommended.doctors' , $intake->id)->with('success', 'Patient intake form submitted successfully.');
    }

     public function showRecommendedDoctors($intakeId)
{
    
    $userId = auth()->id();

    // Check if this intake belongs to the logged-in user
    $intake = PatientIntake::where('id', $intakeId)
                ->where('user_id', $userId)
                ->first();

    if (!$intake) {
        return redirect()->route('patient.intake.form')
            ->with('error', 'You must fill this intake form first.');
    }
    $specialist = strtolower(trim($intake->recommended_specialist));

    $specialistSynonyms = [
        'orthopedic specialist' => ['orthopedic', 'orthopedic specialist', 'orthopedic surgeon', 'orthopedist'],
        'cardiologist' => ['cardiology', 'heart specialist'],
        'dermatologist' => ['skin specialist', 'dermatology'],
        'general practitioner' => ['gp', 'telehealth', 'family doctor'],
        'neurologist' => ['brain specialist', 'neurology'],
        'pediatrician' => ['child specialist', 'paediatrics'],
        'psychiatrist' => ['mental health', 'psychology', 'psychotherapist'],
        'gynecologist' => ['obstetrician', 'women health specialist'],
    ];

    $searchTerms = [$specialist];
    foreach ($specialistSynonyms as $key => $synonyms) {
        if (str_contains($specialist, $key)) {
            $searchTerms = array_merge($searchTerms, $synonyms);
        }
    }

    $doctors = Doctor::join('users', 'doctors.user_id', '=', 'users.id')
        ->where(function ($query) use ($searchTerms) {
            foreach ($searchTerms as $term) {
                $query->orWhereRaw('LOWER(doctors.specialization) LIKE ?', ['%' . strtolower($term) . '%']);
            }
        })
        ->select('doctors.*', 'users.name', 'users.email')
        ->get();

    $doctorIds = $doctors->pluck('id')->toArray();

    $schedules = DB::table('doctor_schedules')
        ->whereIn('doctor_id', $doctorIds)
        ->where('is_available', 1)
        ->orderBy('doctor_id')
        ->get()
        ->groupBy('doctor_id');

    $today = Carbon::today();

    foreach ($doctors as $doctor) {
        $doctorSchedules = $schedules[$doctor->id] ?? collect();

        $oneoff = [];
        $recurring = [];

        foreach ($doctorSchedules as $schedule) {
            if ($schedule->type == 'oneoff') {
                $scheduleDate = Carbon::parse($schedule->date);
                if ($scheduleDate->isFuture() || $scheduleDate->isToday()) {
                    $oneoff[] = $schedule;
                }
            } else { // recurring
                // Group recurring schedules by start_time + end_time
                $key = $schedule->start_time . '_' . $schedule->end_time;
                if (!isset($recurring[$key])) {
                    $recurring[$key] = [];
                }
                $recurring[$key][] = $schedule->day_of_week;
            }
        }

        // Optional: sort recurring days Mon → Sun
        $order = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
        foreach ($recurring as $key => $days) {
            usort($recurring[$key], function($a, $b) use ($order){
                return array_search($a, $order) - array_search($b, $order);
            });
        }

        // Attach schedules to doctor
        $doctor->oneoff_schedules = collect($oneoff);
        $doctor->recurring_schedules = $recurring;
    }

    return view('Patient.show_recommended_doctors', [
        'intake' => $intake,
        'doctors' => $doctors,
    ]);
}







}
