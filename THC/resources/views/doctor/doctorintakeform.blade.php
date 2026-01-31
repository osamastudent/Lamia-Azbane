@extends('doctor.layouts.master')

@section('content')
<div class="container-fluid mt-4">
    <div class="card shadow-lg border-0 rounded-xl">
        <div class="card-header bg-primary text-white py-4 rounded-top-xl">
            <h4 class="mb-0">
                <i class="fas fa-tachometer-alt me-2"></i> Doctor Dashboard: Patient Triage Queue
            </h4>
        </div>
        <div class="card-body p-4">
            <h5 class="text-secondary mb-4">Urgent Cases First</h5>

            @if($intakes->isEmpty())
                <div class="alert alert-info text-center py-4">
                    <i class="fas fa-check-circle me-2"></i> Bahut accha! Filhaal koi naya pending patient intake nahi hai.
                </div>
            @else
                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead class="table-light">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Triage Level</th>
                                <th scope="col">Patient Name</th>
                                <th scope="col">Age</th>
                                <th scope="col">Main Symptoms</th>
                                {{-- <th scope="col">Recommended Specialist</th> --}}
                                <th scope="col">Received At</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($intakes as $index => $intake)
                                @php
                                    // Urgency Color Coding
                                    $colorClass = match($intake->urgency) {
                                        'red' => 'bg-danger text-white',
                                        'orange' => 'bg-warning text-dark',
                                        'yellow' => 'bg-warning-light text-dark',
                                        'green' => 'bg-success text-white',
                                        default => 'bg-secondary text-white', // blue/default
                                    };

                                    // Safely access patient data
                                    $patientName = $intake->user_name ?? 'N/A';
                                    $patientAge = $intake->patient_age ?? 'N/A';

                                    // Decode and display common symptoms
                                    $symptomsArray = json_decode($intake->common_symptoms, true) ?? [];
                                    $mainSymptom = implode(', ', array_slice($symptomsArray, 0, 2)) . (count($symptomsArray) > 2 ? '...' : '');

                                    // Custom class for high urgency rows
                                    $rowClass = ($intake->triage_level <= 2) ? 'table-danger' : ''; // Red/Orange rows highlighted
                                @endphp

                                <tr class="{{ $rowClass }}">
                                    <td>{{ $index + 1 }}</td>
                                    <td>
                                        <span class="badge {{ $colorClass }} p-2 shadow-sm">
                                            L{{ $intake->triage_level }} ({{ ucfirst($intake->urgency) }})
                                        </span>
                                    </td>
                                    <td>{{ $patientName }}</td>
                                    <td>{{ $patientAge }}</td>
                                    <td title="{{ implode(', ', $symptomsArray) }}">{{ $mainSymptom ?: $intake->symptoms }}</td>
                                    {{-- <td>{{ $intake->recommended_specialist }}</td> --}}
                                    <td>{{ \Carbon\Carbon::parse($intake->created_at)->format('M d, h:i A') }}</td>

                                    <td>
                                        {{-- We will create this route next to view full details --}}
                                        <a href="#" class="btn btn-sm btn-outline-primary">
                                            <i class="fas fa-eye me-1"></i> View Case
                                        </a>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            @endif
        </div>
    </div>
</div>
@endsection
