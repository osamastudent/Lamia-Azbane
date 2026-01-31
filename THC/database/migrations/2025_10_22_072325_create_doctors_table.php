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
        Schema::create('doctors', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->unique();
            $table->string('profile_image')->nullable();
            $table->string('gender')->nullable();
            $table->string('phone')->nullable();
            $table->string('address')->nullable();
            $table->string('qualification')->nullable();
            $table->string('specialization')->nullable();
            $table->string('department')->nullable();
            $table->string('hospital_name')->nullable();
            $table->integer('experience_years')->nullable();
            $table->integer('available_days')->nullable();
            $table->time('available_time_start')->nullable();
            $table->time('available_time_end')->nullable();
            $table->enum('status' , ['Active' , 'Inactive'])->default('Active');
            $table->boolean('is_approved')->default(false);
            $table->rememberToken();
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('doctors');
    }
};
