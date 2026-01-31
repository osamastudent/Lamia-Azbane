<?php

namespace App\Http\Controllers\Patient;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Patient;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class PatientProfileController extends Controller
{
    public function view(){
        
        $user = Auth::user();
        $patient = Patient::where('user_id' , $user->id)->first();
        return view('Patient.profile.view', compact('user','patient'));

    }
    
    public function edit()
    {
        $user = Auth::user();
        $patient = Patient::where('user_id', $user->id)->first();
        return view('Patient.profile.edit', compact('user','patient'));
    }
    
    public function update(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'father_husband_name' => 'nullable|string|max:255',
            'email' => 'required|email',
            'password' => 'nullable',
            'dob' => 'nullable',
            'age' => 'nullable',
            'phone' => 'nullable|string|max:20',
            'address' => 'nullable|string|max:500',
            'profile_image' => 'nullable|image|max:2048',
        ]);

        $user = Auth::user();
        $user->name = $request->name;
        $user->father_husband_name = $request->father_husband_name;
        $user->email = $request->email;
        $user->dob = $request->dob;
        
        if ($request->filled('password')) {
        $user->password = Hash::make($request->password);
    }
        $user->save();

        $patient = Patient::where('user_id', $user->id)->first();
        $patient->phone = $request->phone;
        $patient->address = $request->address;
        $patient->age = $request->age;

        if($request->hasFile('profile_image')){
            $imageName = time().'.'.$request->profile_image->extension();
            $request->profile_image->move(public_path('Patient/profile_images'), $imageName);
            $patient->profile_image = $imageName;
        }

        $patient->save();

        return redirect()->route('patient.profile.view')->with('success','Profile updated successfully!');
    }

}
