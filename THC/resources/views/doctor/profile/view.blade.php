@extends('Patient.layouts.master')
@section('title', 'Patient Profile')

@section('content')
<style>
    .custom-bg{
        background-color: #384959;
    }
</style>
<div class="container-fluid px-4 mt-5">

    <div class="row justify-content-center">
        <div class="col-lg-12">
            <div class="card border-0 shadow-lg rounded-4 overflow-hidden">

                {{-- Header --}}
                <div class="card-header custom-bg text-white d-flex justify-content-between align-items-center py-3 px-4">
                    <h5 class="mb-0 fw-semibold">
                        <i class="fas fa-user-injured me-2"></i> My Profile
                    </h5>
                    <div>
                        <a href="{{ route('patient.profile.edit') }}" 
                           class="btn btn-warning btn-sm me-2 px-3 py-1 shadow-sm rounded-pill">
                            <i class="fas fa-pencil-square me-1"></i> Edit
                        </a>
                        <a href="{{ route('patient.dashboard') }}" 
                           class="btn btn-light btn-sm px-3 py-1 shadow-sm rounded-pill">
                            <i class="fas fa-arrow-left-circle me-1"></i> Back
                        </a>
                    </div>
                </div>

                {{-- Body --}}
                <div class="card-body p-4 bg-light">
                    <div class="row g-4 align-items-stretch">

                        {{-- Left: Profile Photo & Basic Info --}}
                        <div class="col-md-4">
                            <div class="card border-0 shadow-sm h-100 rounded-4">
                                <div class="card-body text-center py-4">
                                   @if($patient->profile_image && file_exists(public_path('Patient/profile_images/' . $patient->profile_image)))
                                    <a href="{{ asset('Patient/profile_images/' . $patient->profile_image) }}" target="_blank">
                                        <img src="{{ asset('Patient/profile_images/' . $patient->profile_image) }}" 
                                             alt="Patient Photo"
                                             class="img-fluid rounded-circle shadow-sm border border-3 border-white mb-3"
                                             style="width: 150px; height: 150px; object-fit: cover;">
                                    </a>
                                @else
                                    <img src="{{ asset('img/undraw_profile.svg') }}" 
                                         alt="Default Photo"
                                         class="img-fluid rounded-circle shadow-sm border border-3 border-white mb-3"
                                         style="width: 150px; height: 150px; object-fit: cover;">
                                @endif

                                    <h4 class="fw-bold mb-1 text-dark">{{ $user->name }}</h4>
                                    <p class="text-muted mb-0">{{ $user->email }}</p>
                                </div>
                            </div>
                        </div>

                        {{-- Right: Academic Details --}}
                        <div class="col-md-8">
                            <div class="card border-0 shadow-sm h-100 rounded-4">
                                <div class="card-body p-4">
                                    <table class="table table-bordered align-middle">
                                        <tbody>
                                            <tr>
                                                <th width="35%">Father/Husband Name</th>
                                                <td>{{ $user->father_husband_name }}</td>
                                            </tr>
                                            <tr>
                                                <th>DOB</th>
                                                <td>{{ $user->dob ?? 'N/A' }}</td>
                                            </tr>
                                            </tr>
                                            <tr>
                                                <th>Phone</th>
                                                <td>{{ $patient->phone ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <th>Age</th>
                                                <td>{{ $patient->age ?? 'N/A' }}</td>
                                            </tr>
                                            <tr>
                                                <th>Blood Group</th>
                                                <td>{{ $patient->blood_group ?? 'N/A' }}</td>
                                            </tr>
                                        
                                        </tbody>
                                    </table>
                                </div>

                                {{-- Footer --}}
                                <div class="card-footer text-center bg-light border-0 py-3">
                                    <small class="text-muted">
                                        Last Updated: {{ $patient->updated_at->format('d M Y, h:i A') }}
                                    </small>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>

</div>
@endsection
