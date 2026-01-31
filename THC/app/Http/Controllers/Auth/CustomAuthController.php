<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use App\Models\Doctor;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class CustomAuthController extends Controller
{
    // show login form
    public function loginForm()
    {
        return view('auth.login');
    }

    // handle login
    public function userLogin(Request $request)
    {

        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $credentials = $request->only('email', 'password');
        $remember = $request->filled('remember');

        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return back()->with('emailError', 'No account found with this email address.')->withInput();
        }

        if (!Auth::attempt($credentials, $remember)) {
            return back()->with('passwordError', 'The password you entered is incorrect.')->withInput();
        }

        // Now user is authenticated
        $user = Auth::user();

        // Role-based redirects
        if ($user->role_id == 1) {

            return redirect()->route('admin.dashboard');
        } elseif ($user->role_id == 2) {

            return redirect()->route('patient.dashboard');
        } elseif ($user->role_id == 3) {

            $doctor = Doctor::where('user_id', $user->id)->first();

            if ($doctor && $doctor->is_approved == 0) {
                return redirect()->route('doctor.pending');
            }

            return redirect()->route('doctor.dashboard');
        } else {
            Auth::logout();
            return back()->with('error', 'Unauthorized role.')->withInput();
        }
    }
}
