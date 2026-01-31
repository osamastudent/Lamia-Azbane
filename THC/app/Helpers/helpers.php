<?php

use App\Models\Doctor;
use App\Models\Patient;
use Illuminate\Support\Facades\Auth;

if (!function_exists('getProfileImage')) {
    function getProfileImage()
    {
        $user = Auth::user();

        if (!$user) {
            // Default image agar koi user login nahi hai
            return asset('img/undraw_profile.svg');
        }

        $profileImage = null;

        // Doctor ke liye
        if ($user->role_id == 3) {
            $doctor = Doctor::where('user_id', $user->id)->first();
            if ($doctor && $doctor->profile_image) {
                $profileImage = 'uploads/doctor/profile_images/' . $doctor->profile_image;
            }
        }

        // Patient ke liye
        elseif ($user->role_id == 2) {
            $patient = Patient::where('user_id', $user->id)->first();
            if ($patient && $patient->profile_image) {
                $profileImage = 'Patient/profile_images/' . $patient->profile_image;
            }
        }

        // Agar file exist karti hai
        if ($profileImage && file_exists(public_path($profileImage))) {
            return asset($profileImage);
        }

        // Default fallback image
        return asset('img/undraw_profile.svg');
    }
}
