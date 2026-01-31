<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Doctor;

class EnsureDoctorIsApproved
{
    public function handle(Request $request, Closure $next)
    {
        if (Auth::check() && Auth::user()->role_id == 3) {
            $doctor = Doctor::where('user_id', Auth::id())->first();

            if (!$doctor || $doctor->is_approved != 1) {
                return redirect()->route('doctor.pending')
                    ->with('error', 'Your account is pending approval.');
            }
        }

        return $next($request);
    }
}
