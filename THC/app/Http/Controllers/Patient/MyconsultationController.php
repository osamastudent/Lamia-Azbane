<?php

namespace App\Http\Controllers\patient;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Appointment;
use App\Models\AppointmentNote;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class MyconsultationController extends Controller
{
    public function viewConsultationNote($appointment){
        
     $appointmentId = Appointment::find($appointment);
    
    if (! $appointmentId) {
        abort(404, 'Appointment not found.');
    }

    $user = Auth::user();
    $patient = DB::table('patients')->where('user_id', $user->id)->first();
    
    if (! $patient) {
        abort(403, 'Unauthorized: Patient profile not found.');
    }
    
    if ($patient->id !== $appointmentId->patient_id) {
        abort(403, 'Unauthorized: You do not own this appointment.');
    }

    $note = AppointmentNote::where('appointment_id', $appointmentId->id)->first();

    if (! $note) {
        
        return back()->with('warning', 'No consultation notes found for this appointment.');
    }
 // Appointment find to match patient_id
    $appointment = DB::table('appointments')
        ->where('id', $note->appointment_id)
        ->first();

    if (!$appointment) {
        abort(404, 'Appointment not found.');
    }

    // Check that this logged-in patient owns this appointment
    if ($appointment->patient_id !== $patient->id) {
        abort(403, 'Unauthorized: You do not own this appointment.');
    }

    // Doctor find
    $doctor = DB::table('doctors')
        ->where('id', $note->doctor_id)
        ->first();

    // Doctor user record
    $doctorUser = DB::table('users')
        ->where('id', $doctor->user_id)
        ->first();
        return view('Patient.consultation_note.index', [
        'note' => $note,
        'doctor' => $doctor,
        'doctorUser' => $doctorUser,
        'appointment' => $appointment,
        'patient' => $patient
    ]);
    }

    

}
