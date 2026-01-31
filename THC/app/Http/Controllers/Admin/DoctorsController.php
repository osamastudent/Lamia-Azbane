<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PatientIntake;
use App\Models\Doctor;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Pagination\Paginator;

class DoctorsController extends Controller
{

    public function getalldoctors(Request $request){
    
     $search = trim($request->input('search'));
     
        $query  = Doctor::join(
            'users', 'doctors.user_id', '=' , 'users.id'
            )->select(
                'doctors.id',
                'users.name',
                'users.dob',
                'doctors.profile_image',
                'doctors.gender',
                'doctors.phone',
                'doctors.address',
                'doctors.qualification',
                'doctors.specialization',
                'doctors.department',
                'doctors.hospital_name',
                'doctors.experience_years',
                'doctors.available_days',
                'doctors.available_time_start',
                'doctors.available_time_end',
                'doctors.status',
                'doctors.is_approved'
                );
                
                
                 if(!empty($search)){
                    $query->where(function($q) use ($search){
                        $q->where('users.name' , 'LIKE' , "%{$search}%")
                        ->orwhere('doctors.specialization' , 'LIKE' , "%{$search}%")
                        ->orwhere('doctors.department' , 'LIKE' , "%{$search}%")
                        ->orwhere('doctors.hospital_name' , 'LIKE' , "%{$search}%")
                        ->orwhere('doctors.qualification' , 'LIKE' , "%{$search}%");
                    });
                }

                $doctorData = $query->orderBy('doctors.id' , 'DESC')->paginate(10);
                $doctorData->appends(['search' => $search]);

            return view('admin.doctors', compact('doctorData'));

    }

    public function approved($id){
        $doctor = Doctor::findOrFail($id);
        if($doctor->is_approved == 0){
            $doctor->is_approved = 1;
        $doctor->save();
        }

        return redirect()->back()->with('success' , 'Doctor has been approved successfully');
    }

    public function cancelapproval($id){
        $doctor = Doctor::findOrFail($id);
        if($doctor->is_approved == 1){
            $doctor->is_approved = 0;
        $doctor->save();
        }

        return redirect()->back()->with('success' , 'Doctor revoke successfully');
    }
    
 public function doctorAssign()
{
    $intake = DB::table('patient_intakes')
        ->join('patients', 'patient_intakes.patient_id', '=', 'patients.id')
        ->join('users as patient_users', 'patients.user_id', '=', 'patient_users.id')
        ->select(
            'patient_intakes.id as intake_id',
            'patient_intakes.symptoms',
            'patient_intakes.triage_level',
            'patient_intakes.triage_description',
            'patient_users.name as patient_name',
            'patients.age',
            'patients.gender',
            'patient_intakes.recommended_specialist'
        )
        ->orderBy('patient_intakes.triage_level', 'asc')
        ->paginate(10);

    $approvedDoctors = DB::table('doctors')
        ->join('users', 'doctors.user_id', '=', 'users.id')
        ->where('doctors.is_approved', 1)
        ->select(
            'doctors.id',
            'doctors.specialization',
            'users.name as doctor_name'
        )
        ->get()
        ->groupBy(function ($doc) {
            return strtolower(trim($doc->specialization));
        });

    return view('admin.assign_doctors', compact('intake', 'approvedDoctors'));
}




        
    
}
