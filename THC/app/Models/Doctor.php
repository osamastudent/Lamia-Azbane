<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Doctor extends Model
{
    protected $fillable = [
        'user_id',
        'profile_image',
        'gender',
        'phone',
        'address',
        'qualification',
        'specialization',
        'department',
        'hospital_name',
        'experience_years',
        'available_days',
        'available_time_start',
        'available_time_end',
        'status',
        'is_approved',

    ];
}
