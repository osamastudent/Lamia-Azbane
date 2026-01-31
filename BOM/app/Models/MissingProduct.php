<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MissingProduct extends Model
{
    use HasFactory;

    protected $fillable = [
        'barcode',
        'product_name',
        'product_brand',
        'product_type',
        'barcode_photo_path',
        'ingredient_photo_path',
        'product_images_paths', // Jo fields database mein hain, woh yahan honi chahiye
        'created_by',
    ];

    /**
     * The attributes that should be cast to native types.
     */
    protected $casts = [
        'product_images_paths' => 'array', // JSON ko Array mein badlega
    ];
}