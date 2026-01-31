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
        Schema::create('patient_intakes', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('patient_id');
            $table->string('symptoms')->nullable();
            $table->string('common_symptoms')->nullable();
            $table->string('condition_description')->nullable();
            $table->string('blood_pressure')->nullable();
            $table->float('temperature')->nullable();
            $table->integer('heart_rate')->nullable();
            $table->string('medical_history')->nullable();
            $table->string('other_history')->nullable();
            $table->boolean('pregnancy_status')->nullable();
            $table->boolean('breast_feeding')->nullable();
            $table->string('urgency' , 20)->nullable();
            $table->unsignedTinyInteger('triage_level')->nullable();
            $table->string('triage_description')->nullable();
            $table->string('recommended_specialist')->nullable();

            $table->timestamps();


            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('patient_id')->references('id')->on('patients')->onDelete('cascade');

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('patient_intakes');
    }
};
