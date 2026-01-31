<?php

namespace App\Http\Controllers\Patient;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Doctor;
use App\Models\Patient;
use App\Models\DoctorSchedule;
use App\Models\Appointment;
use App\Models\PatientIntake;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class AppointmentController extends Controller
{

    public function index(){
        $patient = Patient::where('user_id' , Auth::id())->first();
       
        
        if(!$patient){
            return back()->with('error' , 'Patient not Found');
        }
        
        
        
       $appointments = DB::table('appointments')
    ->join('doctors', 'appointments.doctor_id', '=', 'doctors.id')
    ->join('users', 'doctors.user_id', '=', 'users.id')
    ->where('appointments.patient_id', $patient->id)
    ->select(
        'appointments.id as appointment_id',
        'appointments.appointment_date',
        'appointments.appointment_time',
        'appointments.consultation_type',
        'appointments.fee',
        'appointments.status',
        'appointments.payment_status',
        'users.name as doctor_name',
        'doctors.specialization',
        'doctors.experience_years'
    )
    ->orderBy('appointments.appointment_date', 'desc')
    ->get();
        // dd($appointments);
        // $appointments = Appointment::where('patient_id' , $patient->id )
        // ->orderBy('appointment_date', 'desc')
        // ->get();
        
        return view('Patient.appointment.index', compact('appointments'));
    }
    
    public function create($doctor_id)
    {
        
        $doctor = DB::table('doctors')
            ->join('users', 'doctors.user_id', '=', 'users.id')
            ->where('doctors.id', $doctor_id)
            ->select(
                'doctors.*',
                'users.name',
                'users.email'
            )->first();
    
        if (!$doctor) {
            return back()->with('error', 'Doctor not found');
        }
        
        $intake = PatientIntake::where('user_id', Auth::user()->id)
        ->latest('id')
        ->first();
    
        return view('Patient.appointment.create', compact('doctor' , 'intake'));
    }
    


     public function getSlots(Request $request, $doctor_id)
{
    $date = $request->query('date');
    $doctor_id = (int) $doctor_id;

    if (!$date) {
        return response()->json(['error' => 'Date is required'], 400);
    }

    $dayOfWeek = Carbon::parse($date)->format('l');

    // Get schedule
    $oneOffSchedule = DB::table('doctor_schedules')
        ->where('doctor_id', $doctor_id)
        ->where('type', 'oneoff')
        ->whereDate('date', $date)
        ->where('is_available', 1)
        ->first();

    $schedule = $oneOffSchedule ?? DB::table('doctor_schedules')
        ->where('doctor_id', $doctor_id)
        ->where('type', 'recurring')
        ->where('day_of_week', $dayOfWeek)
        ->where('is_available', 1)
        ->first();

    $timeSlots = [];

    if ($schedule) {
        $start = Carbon::createFromFormat('H:i:s', $schedule->start_time);
        $end = Carbon::createFromFormat('H:i:s', $schedule->end_time);

        // Get booked slots for this doctor on this date
        $bookedSlots = DB::table('appointments')
            ->where('doctor_id', $doctor_id)
            ->whereDate('appointment_date', $date)
            ->pluck('appointment_time')
            ->toArray();

        // Convert booked slots to Carbon objects
        $bookedSlots = array_map(function($b) {
    return Carbon::parse($b);
}, $bookedSlots);


        while ($start->lt($end)) {
            $slotStart = $start->copy();
            $slotEnd = $start->copy()->addMinutes(30);
            $displayTime = $slotStart->format('g:i A');

            $isBooked = false;
            foreach ($bookedSlots as $bookedTime) {
                if ($bookedTime->gte($slotStart) && $bookedTime->lt($slotEnd)) {
                    $isBooked = true;
                    break;
                }
            }

            $timeSlots[] = [
                'time' => $displayTime,
                'status' => $isBooked ? 'booked' : 'available'
            ];

            $start->addMinutes(30);
        }
    }

    return response()->json($timeSlots);
}




    public function store(Request $request, $doctor_id)
{
    $validated = $request->validate([
        'patient_intake_id' => 'required|integer',
        'doctor_id'=> 'required',
        'appointment_date' => 'required|date',
        'appointment_time' => 'required|string',
        'consultation_type' => 'required|string',
    ]);
    
    $doctor = Doctor::find($doctor_id);
    if (!$doctor) {
        return back()->with('error', 'Doctor not found.');
    }
  
    
    
    $patient = Patient::where('user_id', Auth::id())->first();
    if (!$patient) {
        return back()->with('error', 'Patient profile not found.');
    }
    
     
    
    
    $appointment = Appointment::create([
        'doctor_id' => $doctor->id,
        'patient_id' => $patient->id,
        'patient_intake_id' => $validated['patient_intake_id'],
        'appointment_date' => $validated['appointment_date'],
        'appointment_time' => $validated['appointment_time'],
        'consultation_type' => $validated['consultation_type'],
        'fee' => $doctor->fee,
        'status' => 'pending',
        'payment_status' => 'unpaid',
    ]);

    // dd($appointment); 

    return redirect()->route('patient.myAppointments')
        ->with('success', 'Your appointment has been booked successfully!');
}



public function myAppointments()
{
    $userId = Auth::id();

    $appointments = DB::table('appointments')
        ->join('patients', 'appointments.patient_id', '=', 'patients.id')
        ->join('users as patient_users', 'patients.user_id', '=', 'patient_users.id')
        ->join('doctors', 'appointments.doctor_id', '=', 'doctors.id')
        ->join('users as doctor_users', 'doctors.user_id', '=', 'doctor_users.id')
        ->leftJoin('patient_intakes', 'appointments.patient_intake_id', '=', 'patient_intakes.id')
        ->select(
            'appointments.id',
            'appointments.appointment_date',
            'appointments.appointment_time',
            'appointments.consultation_type',
            'appointments.status',
            'appointments.payment_status',
            'appointments.fee',
            'doctor_users.name as doctor_name',
            'patient_intakes.triage_level',
            'patient_intakes.urgency',
            'patient_intakes.condition_description'
        )
        ->where('patient_users.id', $userId)
        ->orderByDesc('appointments.id')
        ->paginate(10);

    return view('Patient.appointment.myappointment', compact('appointments'));
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
    
        return view('Patient.appointment.view', compact('appointment'));
    }


     
    
}