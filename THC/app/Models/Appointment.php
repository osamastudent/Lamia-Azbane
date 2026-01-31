<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Appointment extends Model
{
    use HasFactory;

    /**
     * Table name
     */
    protected $table = 'appointments';

    /**
     * Mass assignable columns
     */
    protected $fillable = [
        'doctor_id',
        'patient_id',
        'patient_intake_id',
        'appointment_date',
        'appointment_time',
        'consultation_type',
        'status',
        'fee',
        'payment_status',
        'meeting_link',
    ];

    /**
     * Default attributes
     */
    protected $attributes = [
        'status' => 'pending',
        'payment_status' => 'unpaid',
    ];

    /**
     * Casting for date fields
     */
    protected $casts = [
        'appointment_date' => 'date',
    ];

    /**
     * Accessors / helpers
     */
    public function getIsOnlineAttribute()
    {
        return $this->consultation_type === 'online';
    }

    public function getIsClinicAttribute()
    {
        return $this->consultation_type === 'clinic';
    }

    public function getFormattedDateAttribute()
    {
        return $this->appointment_date ? $this->appointment_date->format('d M Y') : null;
    }

    public function getFormattedTimeAttribute()
    {
        return date('g:i A', strtotime($this->appointment_time));
    }
}
