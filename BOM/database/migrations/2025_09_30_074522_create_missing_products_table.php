<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('missing_products', function (Blueprint $table) {
            $table->id();
            
            // --- Nayi Fields Yahan Shuru Hoti Hain ---
            
            // Text Fields
            $table->string('product_name');             // Required field
            $table->string('barcode')->nullable();      // Barcode field, user isko khali chhod sakta hai
            $table->string('product_brand')->nullable();
            $table->string('product_type')->nullable();
            
            // Photo Path Fields (File ki URL/Path store karne ke liye)
            $table->string('barcode_photo_path');       // Required file
            $table->string('ingredient_photo_path');    // Required file
            
            // Multiple Images ke liye (JSON format mein paths store honge)
            $table->json('product_images_paths')->nullable(); 
            
            // --- Nayi Fields Yahan Khatam Hoti Hain ---
            
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('missing_products');
    }
};