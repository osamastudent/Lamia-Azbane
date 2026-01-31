<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AppointmentNote extends Model
{
    protected $fillable = [
        'appointment_id',
        'doctor_id',
        'diagnosis',
        'treatment_plan',
        'follow_up',
    ];
}
