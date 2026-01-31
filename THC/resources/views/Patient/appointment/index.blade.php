@extends('Patient.layouts.master')

@section('content')

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style>
    body {
        background-color: #0D1B2A;
        color: #E0E6ED;
        font-family: 'Poppins', sans-serif;
    }
    .container {
        background-color: #1B263B;
        border-radius: 15px;
        padding: 25px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.5);
    }
    h3 {
        color: #00B4D8;
        font-weight: 600;
        border-bottom: 2px solid #00B4D8;
        padding-bottom: 10px;
    }
    .table {
        color: #E0E6ED;
    }
    .table thead {
        background-color: #0D1B2A;
        color: #00B4D8;
        border-bottom: 2px solid #00B4D8;
    }
    .table tbody tr {
        transition: all 0.2s ease;
    }
    .table tbody tr:hover {
        background-color: #2A3A52;
        transform: scale(1.01);
    }
    .badge {
        font-size: 0.85rem;
        padding: 6px 10px;
        border-radius: 8px;
    }
    .badge.bg-warning {
        background-color: #FFB703 !important;
        color: #000;
    }
    .badge.bg-success {
        background-color: #2A9D8F !important;
    }
    .badge.bg-danger {
        background-color: #E63946 !important;
    }
    .alert {
        border-radius: 10px;
        font-weight: 500;
    }
    .alert-success {
        background-color: #2A9D8F;
        color: #fff;
    }
    .alert-danger {
        background-color: #E63946;
        color: #fff;
    }
    .alert-info {
        background-color: #457B9D;
        color: #fff;
    }
</style>

<div class="container mt-4">
    <h3 class="mb-4"><i class="fas fa-calendar-alt me-2"></i>Your Appointments</h3>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @elseif(session('error'))
        <div class="alert alert-danger">{{ session('error') }}</div>
    @endif

    @if($appointments->count() > 0)
        <div class="table-responsive">
            <table class="table align-middle">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Doctor</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Consultation Type</th>
                        <th>Fee</th>
                        <th>Status</th>
                        <th>Payment</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($appointments as $key => $appointment)
                        <tr>
                            <td>{{ $key + 1 }}</td>
                            <td class="fw-semibold text-info">
                                <i class="fas fa-user-md me-1"></i> {{ $appointment->doctor_name }}
                            </td>
                            <td>{{ \Carbon\Carbon::parse($appointment->appointment_date)->format('d M Y') }}</td>
                            <td>{{ $appointment->appointment_time }}</td>
                            <td>{{ ucfirst($appointment->consultation_type) }}</td>
                            <td>{{ $appointment->fee }} PKR</td>
                            <td>
                                <span class="badge bg-{{ $appointment->status == 'pending' ? 'warning' : 'success' }}">
                                    {{ ucfirst($appointment->status) }}
                                </span>
                            </td>
                            <td>
                                <span class="badge bg-{{ $appointment->payment_status == 'unpaid' ? 'danger' : 'success' }}">
                                    {{ ucfirst($appointment->payment_status) }}
                                </span>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    @else
        <div class="alert alert-info">No appointments found.</div>
    @endif
</div>

@endsection
