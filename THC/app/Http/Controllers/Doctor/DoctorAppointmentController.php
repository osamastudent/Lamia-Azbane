<?php

namespace App\Http\Controllers\Doctor;

use App\Http\Controllers\Controller;
use App\Models\PatientIntake;
use App\Models\Doctor;
use App\Models\Patient;
use App\Models\Appointment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Log;
use App\Mail\OnlineMeetingLinkMail;
use App\Models\AppointmentNote;
use App\Mail\ConsultationNotesMail;

class DoctorAppointmentController extends Controller
{


   public function index(Request $request)
    {
        $doctor = Doctor::where('user_id', Auth::id())->first();
    
        if (!$doctor) {
            return back()->with('error', 'Doctor profile not found.');
        }
    
        $appointments = DB::table('appointments')
            ->join('patients', 'appointments.patient_id', '=', 'patients.id')
            ->join('users', 'patients.user_id', '=', 'users.id')
            ->join('patient_intakes', 'appointments.patient_intake_id', '=', 'patient_intakes.id')
            ->where('appointments.doctor_id', $doctor->id)
            ->select(
                'appointments.id as appointment_id',
                'appointments.appointment_date',
                'appointments.appointment_time',
                'appointments.consultation_type',
                'appointments.status as appointment_status',
                'users.name as patient_name',
                'users.email as patient_email',
                'patient_intakes.id as intake_id',
                'patient_intakes.triage_level',
                'patient_intakes.triage_description',
                'patients.age',
                'patients.gender',
                'patient_intakes.recommended_specialist',
                'patient_intakes.symptoms',
                'patient_intakes.common_symptoms',
                'patient_intakes.condition_description',
                'appointments.consultation_type',
                'patient_intakes.blood_pressure',
                'patient_intakes.temperature',
                'patient_intakes.heart_rate'
            );
        
            if ($request->has('search') && $request->search != '') {
            $search = $request->search;
            $appointments->where(function($q) use ($search) {
                $q->where('users.name', 'like', "%{$search}%")
                  ->orWhere('patient_intakes.symptoms', 'like', "%{$search}%")
                  ->orWhere('appointments.consultation_type', 'like', "%{$search}%");
            });
        }
            $appointments = $appointments->orderBy('patient_intakes.triage_level', 'asc')->paginate(10);
            
        
        return view('doctor.appointments.index', compact('appointments'));
    }

    public function view($id)
        {
        $appointment = DB::table('appointments')
            ->join('patients', 'appointments.patient_id', '=', 'patients.id')
            ->join('users', 'patients.user_id', '=', 'users.id')
            ->join('patient_intakes', 'appointments.patient_intake_id', '=', 'patient_intakes.id')
            ->select(
                'appointments.id',
                'appointments.appointment_date',
                'appointments.appointment_time',
                'appointments.consultation_type',
                'appointments.status',
                'appointments.fee',
                'appointments.payment_status',
                'appointments.meeting_link',
    
                // Fields coming from patient_intakes
                'patient_intakes.symptoms',
                'patient_intakes.common_symptoms',
                'patient_intakes.condition_description',
                'patient_intakes.triage_level',
                'patient_intakes.urgency',
                'patient_intakes.triage_description',
                'patient_intakes.pregnancy_status',
                'patient_intakes.breast_feeding',
    
                // Patient details
                'users.name as patient_name',
                'patients.age',
                'patients.gender',
                'patient_intakes.blood_pressure',
                'patient_intakes.temperature',
                'patient_intakes.heart_rate',
                'patient_intakes.recommended_specialist'
            )
            ->where('appointments.id', $id)
            ->first();
    
        if (!$appointment) {
            return redirect()->back()->with('error', 'Appointment not found.');
        }
    
        // Decode common symptoms properly
        if (!empty($appointment->common_symptoms)) {
            $decoded = json_decode($appointment->common_symptoms, true);
            $appointment->common_symptoms = is_array($decoded) ? $decoded : [];
        } else {
            $appointment->common_symptoms = [];
        }
    
        return view('doctor.appointments.view', compact('appointment'));
    }

     public function updateStatus(Request $request, Appointment $appointment)
            {
                $status = $request->input('status');
            
                if (!in_array($status, ['pending', 'approved', 'completed', 'cancelled'])) {
                    return back()->with('error', 'Invalid status.');
                }
            
                $appointment->status = $status;
            
                // Generate meeting link if not exists and consultation is online
                if (!$appointment->meeting_link && $appointment->consultation_type === 'online') {
                    $docId = $appointment->doctor_id;
                    $patId = $appointment->patient_id;
                    $appointmentId = $appointment->id;
            
                    $roomName = 'Dr' . $docId . '_Pat' . $patId . '_App' . $appointmentId;
            
                    $appointment->meeting_link = 'https://meet.jit.si/' . $roomName
                        . '#config.prejoinPageEnabled=false&config.requireModerator=false';
                }
            
                $appointment->save();
            
                $emailSent = false;
            
                // Send email only if approved and online
                if ($status === 'approved' && $appointment->consultation_type === 'online') {
                    $patient = DB::table('patients')
                        ->join('users', 'patients.user_id', '=', 'users.id')
                        ->where('patients.id', $appointment->patient_id)
                        ->select('users.name', 'users.email')
                        ->first();
            
                    if ($patient) {
                        $appointment->patient_name = $patient->name;
                        $appointment->patient_email = $patient->email;
            
                        try {
                            Mail::to($patient->email)->send(new OnlineMeetingLinkMail($appointment));
                            $emailSent = true;
                        } catch (\Exception $e) {
                            Log::error('Email sending failed: ' . $e->getMessage());
                        }
                    }
                }
            
                // Return proper message
                if ($status === 'approved' && $appointment->consultation_type === 'online') {
                    if ($emailSent) {
                        return back()->with('success', 'Appointment approved and email sent to patient.');
                    } else {
                        return back()->with('warning', 'Appointment approved but email could not be sent.');
                    }
                }
            
                return back()->with('success', 'Appointment status updated successfully!');
            }

    
       public function onlinemeetings()
        {
            $doctor = Doctor::where('user_id', Auth::id())->first();
        
            if (!$doctor) {
                return back()->with('error', 'Doctor profile not found.');
            }
        
            $appointments = DB::table('appointments')
                ->join('patients', 'appointments.patient_id', '=', 'patients.id')
                ->join('users', 'patients.user_id', '=', 'users.id')
                ->join('patient_intakes', 'appointments.patient_intake_id', '=', 'patient_intakes.id')
                ->where('appointments.doctor_id', $doctor->id)
                ->where('appointments.consultation_type', 'online') // only online
                ->where('appointments.status', 'approved')         // only approved
                ->select(
                    'appointments.id as appointment_id',
                    'appointments.appointment_date',
                    'appointments.appointment_time',
                    'appointments.consultation_type',
                    'appointments.meeting_link',
                    'appointments.status as appointment_status',
                    'users.name as patient_name',
                    'users.email as patient_email',
                    'patient_intakes.id as intake_id',
                    'patient_intakes.triage_level',
                    'patient_intakes.triage_description',
                    'patients.age',
                    'patients.gender',
                    'patient_intakes.recommended_specialist',
                    'patient_intakes.symptoms',
                    'patient_intakes.common_symptoms',
                    'patient_intakes.condition_description',
                    'patient_intakes.blood_pressure',
                    'patient_intakes.temperature',
                    'patient_intakes.heart_rate'
                )
                ->orderBy('appointments.appointment_date', 'asc')
                ->paginate(10);
        
            return view('doctor.appointments.onlinemeetings.index', compact('appointments'));
        }


        public function consult($id)
    {
      
        $appointment = DB::table('appointments')
            ->join('patients', 'appointments.patient_id', '=', 'patients.id')
            ->join('users', 'patients.user_id', '=', 'users.id')
            ->join('patient_intakes', 'patient_intakes.patient_id', '=', 'patients.id')
            ->select(
                'appointments.*',
                'appointments.id as appointment_id',
                'patients.age as patient_age',
                'patients.gender as patient_gender',
                'users.name as patient_name',
                'patient_intakes.id as intake_id',
                'patient_intakes.*'
            )
            ->where('appointments.id', $id)
            ->first();
    
        if (!$appointment) {
            abort(404, 'Appointment not found');
        }
        
         $doctor = Doctor::where('user_id', Auth::id())->first();

        $note = AppointmentNote::where('doctor_id', $doctor->id)
        ->where('appointment_id', $appointment->appointment_id)
        ->first();
        if (!empty($appointment->common_symptoms)) {
            $decoded = json_decode($appointment->common_symptoms, true);
            $appointment->common_symptoms = is_array($decoded) ? $decoded : [];
        } else {
            $appointment->common_symptoms = [];
        }

        return view('doctor.appointments.onlinemeetings.consult', compact('appointment' , 'note'));
    }




   public function storeNotes(Request $request, $id)
{
    
    $request->validate([
        'diagnosis' => 'required|string',
        'treatment_plan' => 'required|string',
        'follow_up' => 'nullable|string',
    ]);

    $isExist=Appointment::where('doctor_id',$request->doctor_id)->where('patient_id',$request->patient_id)->where('patient_intake_id',$request->patient_intake_id)->first();
    if($isExist){
        $appointment=$isExist->id;
    }
  
    $doctor = Doctor::where('user_id', Auth::id())->first();
    if (!$doctor) return back()->with('error', 'Doctor profile not found.');

    // Check if appointment exists
    $appointment = Appointment::find($appointment);
    if (!$appointment) {
        return back()->with('error', 'Appointment not found.');
    }

    $note = AppointmentNote::updateOrCreate([
        'appointment_id' => $appointment->id,
        'doctor_id' => $doctor->id,
        'diagnosis' => $request->diagnosis,
        'treatment_plan' => $request->treatment_plan,
        'follow_up' => $request->follow_up,
    ]);
    
     // ✅ Get patient info manually
    $patient = DB::table('patients')
        ->join('users', 'patients.user_id', '=', 'users.id')
        ->where('patients.id', $appointment->patient_id)
        ->select('users.name', 'users.email')
        ->first();

    // ✅ Send email
    if ($patient && $patient->email) {
        Mail::to($patient->email)->send(new ConsultationNotesMail($note, $appointment, $patient));
    }

    return back()->with('success', 'Notes saved and sent to patient.');
}

public function autoSaveNotes(Request $request, $id)
{
    
    
    try {
        // Validate minimum fields (optional)
        $request->validate([
            'diagnosis' => 'nullable|string',
            'treatment_plan' => 'nullable|string',
            'follow_up' => 'nullable|string',
        ]);
 $isExist=Appointment::where('doctor_id',$request->doctor_id)->where('patient_id',$request->patient_id)->where('patient_intake_id',$request->patient_intake_id)->first();
    if($isExist){
        $appointment=$isExist->id;
    }
        $doctor = Doctor::where('user_id', Auth::id())->first();
        if (!$doctor) {
            return response()->json(['error' => 'Doctor profile not found.'], 404);
        }

      $appointment = Appointment::find($appointment);
        if (!$appointment) {
            return response()->json(['error' => 'Appointment not found.'], 404);
        }

        // Check if note already exists for this appointment & doctor
        $note = AppointmentNote::where('appointment_id', $appointment->id)
            ->where('doctor_id', $doctor->id)
            ->first();

        if ($note) {
            // Update existing note
            $note->update([
                'diagnosis' => $request->diagnosis,
                'treatment_plan' => $request->treatment_plan,
                'follow_up' => $request->follow_up,
            ]);
        } else {
            // Create new note
            $note = AppointmentNote::create([
                'appointment_id' => $appointment->id,
                'doctor_id' => $doctor->id,
                'diagnosis' => $request->diagnosis,
                'treatment_plan' => $request->treatment_plan,
                'follow_up' => $request->follow_up,
            ]);
        }

        return response()->json([
            'success' => true,
            'message' => 'Auto-saved successfully',
            'updated_at' => $note->updated_at->format('Y-m-d H:i:s'),
        ]);
    } catch (\Exception $e) {
        return response()->json(['error' => $e->getMessage()], 500);
    }
}



}