<?php

namespace App\Http\Controllers\Doctor;

use App\Http\Controllers\Controller;

class DoctorDashboardController extends Controller
{
    public function index(){
        return view('doctor.dashboard');
    }

    public function pending(){
        return view('doctor.approvalpending');
    }

}
