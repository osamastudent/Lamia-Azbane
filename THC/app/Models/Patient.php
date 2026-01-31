<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Patient extends Model
{
    protected $fillable = [
        'user_id',
        'profile_image',
        'age',
        'gender',
        'phone',
        'address',
        'blood_group'
    ];
}
