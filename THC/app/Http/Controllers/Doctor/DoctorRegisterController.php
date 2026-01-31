<?php

namespace App\Http\Controllers\Doctor;

use App\Http\Controllers\Controller;
use App\Models\Doctor;
use App\Models\Roles;
use App\Models\User;
use App\Models\Specialization;
use App\Models\Department;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class DoctorRegisterController extends Controller
{
    public function showRegisterForm(){
        $specializations = Specialization::where('is_active' , 1)
                        ->orderBy('name')->get();
                        
        $department = Department::orderBy('name')->get();
                        
        return view('auth.doctor.register' , compact('specializations' , 'department'));
    }
    public function register(Request $request){

        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'father_husband_name' => 'required|string|max:255',
            'dob' => 'required|date',
            'gender' => 'required|string',
            'phone' => 'required|string|regex:/^[0-9]{10,20}$/',
            'email' => 'required|email|unique:users,email',
            'address' => 'required|string|max:500',
            'password' => 'required|min:8|confirmed',
            'qualification' => 'required|string',
            'specialization' => 'required|string',
            'department' => 'required|string',
            'hospital_name' => 'required|string',
            'experience_years' => 'required|string',
            // 'available_days' => 'required|array',
            // 'available_days.*' => 'string|in:Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',
            // 'available_time_start' => 'required|date_format:H:i',
            // 'available_time_end' => 'required|date_format:H:i',
            'profile_image' => 'required|file|mimes:jpg,jpeg,png,pdf|max:2048',

        ]);

        return DB::transaction(function() use ($request, $validated){

            $user = User::create([
                'name' => $validated['name'],
                'father_husband_name' => $validated['father_husband_name'],
                'email' => $validated['email'],
                'password' => Hash::make($validated['password']),
                'dob' => $validated['dob'],
            ]);

            $doctorRole = Roles::where('title' , 'doctor')->firstOrFail();
            if($doctorRole){
                $user->role_id = $doctorRole->id;
                $user->save();
            }

            $imagePath = null;
            if($request->hasFile('profile_image')){
                $file = $request->file('profile_image');
                $filename = time(). '_' . $file->getClientOriginalName();

                $destinationPath = public_path('uploads/doctor/profile_images');
                if(!file_exists($destinationPath)){
                    mkdir($destinationPath, 0755 , true);
                }

                $file->move($destinationPath , $filename);
             $imagePath = $validated['profile_image'] =  $filename;
            }

            // $validated['available_days'] = json_encode($validated['available_days']);


            Doctor::create([
                'user_id' => $user->id,
                'profile_image' => $imagePath,
                'gender' => $validated['gender'],
                'phone' => $validated['phone'],
                'address' => $validated['address'],
                'qualification' => $validated['qualification'],
                'specialization' => $validated['specialization'],
                'department' => $validated['department'],
                'hospital_name' => $validated['hospital_name'],
                'experience_years' => $validated['experience_years'],
                // 'available_days' => $validated['available_days'],
                // 'available_time_start' => $validated['available_time_start'],
                // 'available_time_end' => $validated['available_time_end'],
                'status' => 'Active',
                'is_approved' => false,
            ]);
            return redirect()->route('login')->with('success' , 'Created Successfully');

        });

    }
}
