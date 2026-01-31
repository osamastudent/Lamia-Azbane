@extends('Patient.layouts.master')

@section('content')

<style>
    /* Page Background (Same as appointments page) */
    body {
        background-color: #f5f7fa !important;
        color: #2c3e50 !important;
        font-family: 'Poppins', sans-serif;
    }

    /* Main Card */
    .consult-card {
        background: #fff;
        border: 1px solid #e5e9f2;
        border-radius: 16px;
        box-shadow: 0px 4px 15px rgba(0,0,0,0.05);
    }

    /* Header Styling (Same dark top header like your list page) */
    .consult-header {
        padding: 20px 25px;
        border-bottom: 1px solid #e5e9f2;
        background: #384959;
        border-radius: 16px 16px 0 0;
    }
    .consult-header h1 {
        font-size: 22px;
        font-weight: 600;
        color: white;
        margin: 0;
    }

    /* Section Title */
    .consult-section-title {
        font-size: 18px;
        color: #0d6efd;
        font-weight: 600;
        margin-bottom: 15px;
    }

    /* Light Boxes */
    .consult-box {
        background-color: #f8fafc;
        border: 1px solid #e2e8f0;
        border-radius: 12px;
        padding: 15px;
        color: #2c3e50;
    }

    .consult-label {
        color: #6c7a91;
        font-weight: 600;
        margin-bottom: 3px;
    }

</style>

<div class="container-fluid my-4">
    <div class="consult-card">

        <!-- Header -->
        <div class="consult-header">
            <h1><i class="fas fa-file-medical me-2"></i> Consultation Note</h1>
        </div>

        <div class="p-4">

            <!-- Appointment Details -->
            <h4 class="consult-section-title">Appointment Details</h4>

            <div class="row mb-4 border-bottom pb-3" style="border-color:#e5e9f2 !important;">
                <div class="col-md-4">
                    <p class="mb-1"><strong>Doctor:</strong> {{ $doctorUser->name }}</p>
                </div>
                <div class="col-md-4">
                    <p class="mb-1"><strong>Date:</strong> {{ $appointment->appointment_date }}</p>
                </div>
                <div class="col-md-4">
                    <p class="mb-1"><strong>Time:</strong> {{ $appointment->appointment_time }}</p>
                </div>
            </div>

            <!-- Doctor Findings -->
            <h4 class="consult-section-title"><i class="fas fa-notes-medical me-1"></i> Doctor's Findings</h4>

            <div class="row">

                <!-- Diagnosis -->
                <div class="col-12 mb-3">
                    <div class="consult-box">
                        <p class="consult-label"><strong>Diagnosis:</strong></p>
                        <p class="mb-0">{{ $note->diagnosis ?? 'N/A' }}</p>
                    </div>
                </div>

                <!-- Treatment Plan -->
                <div class="col-12 mb-3">
                    <div class="consult-box">
                        <p class="consult-label"><strong>Treatment Plan:</strong></p>
                        <p class="mb-0">{{ $note->treatment_plan ?? 'N/A' }}</p>
                    </div>
                </div>

                <!-- Follow Up -->
                <div class="col-12 mb-3">
                    <div class="consult-box">
                        <p class="consult-label"><strong>Follow Up Instructions:</strong></p>
                        <p class="mb-0">{{ $note->follow_up ?? 'No follow-up required.' }}</p>
                    </div>
                </div>

                <!-- Footer Meta -->
                <div class="col-12 text-end mt-3 border-top pt-3" style="border-color:#e5e9f2 !important;">
                    <small class="text-muted">
                        Note recorded by <strong>{{ $doctorUser->name }}</strong>
                        on {{ \Carbon\Carbon::parse($note->created_at)->format('M d, Y h:i A') }}
                    </small>
                </div>
            </div>

            <!-- Back Button -->
            <div class="mt-4">
                <a href="{{ route('patient.myAppointments') }}" class="btn btn-outline-primary">
                    <i class="fas fa-arrow-left me-1"></i> Back to Appointments
                </a>
            </div>

        </div>
    </div>
</div>

@endsection
