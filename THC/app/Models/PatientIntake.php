<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PatientIntake extends Model
{
    protected $fillable = [
        'user_id',
        'patient_id',
        'symptoms',
        'common_symptoms',
        'condition_description',
        'blood_pressure',
        'temperature',
        'heart_rate',
        'medical_history',
        'other_history',
        'pregnancy_status',
        'breast_feeding',
        'urgency',
        'triage_level',
        'triage_description',
        'recommended_specialist',

    ];
}
