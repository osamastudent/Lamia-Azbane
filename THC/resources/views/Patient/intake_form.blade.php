@extends('Patient.layouts.master')

@section('content')
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
    crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
    :root {
        --primary: #4361ee;
        --primary-light: #4895ef;
        --secondary: #3f37c9;
        --light-bg: #f8f9fa;
        --card-bg: #ffffff;
        --text-primary: #212529;
        --text-secondary: #6c757d;
        --border-color: #e9ecef;
        --shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        --shadow-hover: 0 8px 30px rgba(0, 0, 0, 0.12);
    }

    /*body {*/
    /*    background-color: var(--light-bg);*/
    /*    color: var(--text-primary);*/
    /*    font-family: 'Poppins', sans-serif;*/
    /*    line-height: 1.6;*/
    /*}*/

    .intake-card {
        background: var(--card-bg);
        border-radius: 18px;
        box-shadow: var(--shadow);
        padding: 50px 45px;
        transition: all 0.3s ease-in-out;
        border: 1px solid var(--border-color);
        width: 100%;
        max-width: 1200px;
        margin: 0 auto;
    }

    .intake-card:hover {
        box-shadow: var(--shadow-hover);
        transform: translateY(-3px);
    }

    h3 {
        color: var(--primary);
        font-weight: 700;
        text-align: center;
        margin-bottom: 15px;
        letter-spacing: 0.5px;
    }

    .form-section-title {
        font-weight: 600;
        font-size: 1.1rem;
        margin-bottom: 1rem;
        color: var(--primary);
        border-left: 4px solid var(--primary-light);
        padding-left: 10px;
    }

    .form-control,
    .form-select,
    textarea {
        background-color: var(--card-bg);
        color: var(--text-primary);
        border-radius: 10px;
        border: 1px solid var(--border-color);
        transition: 0.25s ease;
        font-size: 0.95rem;
    }

    .form-control:focus,
    .form-select:focus,
    textarea:focus {
        border-color: var(--primary-light);
        box-shadow: 0 0 0 0.15rem rgba(67, 97, 238, 0.15);
        background-color: var(--card-bg);
        color: var(--text-primary);
    }

    .btn-primary {
        background: linear-gradient(90deg, var(--primary), var(--secondary));
        border: none;
        border-radius: 12px;
        padding: 12px 35px;
        font-weight: 600;
        letter-spacing: 0.3px;
        transition: all 0.3s ease;
    }

    .btn-primary:hover {
        background: linear-gradient(90deg, var(--primary-light), var(--primary));
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(67, 97, 238, 0.3);
    }

    .form-check-label {
        color: var(--text-primary);
        font-size: 0.95rem;
    }

    .card {
        background: var(--card-bg);
        color: var(--text-primary);
        border: 1px solid var(--border-color);
        border-radius: 14px;
    }

    hr {
        border-top: 2px solid var(--border-color);
        margin: 1.5rem 0;
    }

    /*.alert-danger {*/
    /*    border-radius: 10px;*/
    /*    background-color: #f8d7da;*/
    /*    color: #721c24;*/
    /*    border: none;*/
    /*}*/

    /*.alert-success {*/
    /*    border-radius: 10px;*/
    /*    background-color: #d1edff;*/
    /*    color: #0c5460;*/
    /*    border: none;*/
    /*}*/

    .text-muted {
        color: var(--text-secondary) !important;
    }

    ::placeholder {
        color: var(--text-secondary) !important;
    }

    .profile-section img {
        border: 3px solid var(--primary-light);
    }

    .border-end {
        border-color: var(--border-color) !important;
    }

    .fw-medium {
        font-weight: 500;
    }
    
    .form-control:disabled, .form-control[readonly] {
        background-color: #f1f3f9 !important;
        opacity: 1;
    }
    
    .suggestion-box {
        background: #e8f4ff;
        border-left: 4px solid var(--primary-light);
    }
    
    .female-health-section {
        background: #f0f7ff;
        border-radius: 12px;
    }
    
    .form-check-input:checked {
        background-color: var(--primary);
        border-color: var(--primary);
    }
    
    .profile-details {
        background: linear-gradient(135deg, #f5f7ff 0%, #f0f4ff 100%);
        border-radius: 14px;
    }
    
    .icon-primary {
        color: var(--primary);
    }
    
    .icon-warning {
        color: #fd7e14;
    }
    
    .icon-danger {
        color: #e83e8c;
    }
</style>

@if(session('success'))
    <div class="alert alert-success">
        {{ session('success') }}
    </div>
@endif

<div class="container py-4">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="intake-card">
                <h3>Patient Intake Form</h3>
                <p class="text-center text-muted mb-4">
                    Please fill your health details carefully so our system can assess your condition.
                </p>
                <hr>

                <form method="POST" action="{{route('patient.intake.store')}}">
                    @csrf

                    {{-- Errors --}}
                    @if ($errors->any())
                        <div class="alert alert-danger small">
                            <ul class="mb-0">
                                @foreach ($errors->all() as $err)
                                    <li>{{ $err }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif

                    {{-- Hidden --}}
                    <input type="hidden" name="user_id" value="{{ $patientData->user_id }}">

                    {{-- Patient Info --}}
                    <div class="mb-5">
                        <div class="form-section-title">Patient Information</div>

                        <div class="card border-0 p-4 profile-details">
                            <div class="row align-items-center">
                                <div class="col-md-4 text-center border-end">
                                    <div class="profile-section">
                                        @if($patientData->profile_image)
                                            <img src="{{ asset('Patient/profile_images/' . $patientData->profile_image) }}"
                                                alt="Patient Image"
                                                class="img-thumbnail shadow-sm mb-3"
                                                style="width: 150px; height: 150px; object-fit: cover; border-radius: 50%;">
                                        @else
                                            <img src="{{ asset('default-avatar.png') }}"
                                                alt="Default Image"
                                                class="img-thumbnail shadow-sm mb-3"
                                                style="width: 150px; height: 150px; object-fit: cover; border-radius: 50%;">
                                        @endif

                                        <h5 class="fw-bold mb-1" style="color: var(--primary);">{{ $patientData->name }}</h5>
                                        <p class="text-muted mb-0" style="font-size: 0.9rem;">{{ $patientData->email }}</p>
                                    </div>
                                </div>

                                <div class="col-md-8">
                                    <div class="row">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Gender</label>
                                            <input type="text" class="form-control" value="{{ $patientData->gender ?? 'N/A' }}" readonly>
                                        </div>

                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Age</label>
                                            <input type="text" class="form-control" value="{{ $patientData->age ?? 'N/A' }}" readonly>
                                        </div>

                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Phone</label>
                                            <input type="text" class="form-control" value="{{ $patientData->phone ?? 'N/A' }}" readonly>
                                        </div>

                                        <div class="col-md-6 mb-3">
                                            <label class="form-label">Blood Group</label>
                                            <input type="text" class="form-control" value="{{ $patientData->blood_group ?? 'N/A' }}" readonly>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    {{-- Symptoms Section --}}
                    <div class="mb-5">
                        <div class="form-section-title mb-3">Symptoms & Condition</div>
                        <div class="card shadow-sm border-0">
                            <div class="card-body">
                                <div class="mb-4">
                                    <label class="form-label fw-semibold">Describe Your Symptoms</label>
                                    <textarea name="symptoms" class="form-control shadow-sm" rows="4"
                                        placeholder="e.g. Fever, sore throat, dry cough...">{{ old('symptoms') }}</textarea>
                                </div>

                                <label class="form-label fw-semibold mb-3">Select Common Symptoms</label>
                                <div class="row gy-2 gx-4">
                                    @php
                                        $symptoms = [
                                            'Fever', 'Cough', 'Headache', 'Fatigue',
                                            'Body Pain', 'Sore Throat', 'Nausea', 'Shortness of Breath',
                                            'Cold / Flu', 'Loss of Taste or Smell', 'Vomiting', 'Dizziness'
                                        ];
                                    @endphp

                                    @foreach($symptoms as $symptom)
                                        <div class="col-md-6 col-lg-4">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="common_symptoms[]" value="{{ $symptom }}"
                                                    id="sym_{{ Str::slug($symptom) }}">
                                                <label class="form-check-label fw-medium" for="sym_{{ Str::slug($symptom) }}">
                                                    {{ $symptom }}
                                                </label>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>

                                <div class="mt-4">
                                    <label class="form-label fw-semibold">Additional Notes</label>
                                    <textarea name="condition_description" class="form-control shadow-sm" rows="3"
                                        placeholder="Any additional details about your condition...">{{ old('condition_description') }}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                    {{-- Vitals --}}
                    <div class="mb-4">
                        <div class="form-section-title mb-3">Vitals (Optional)</div>
                        <div class="card shadow-sm border-0">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                        <label class="form-label fw-semibold text-secondary">
                                            <i class="fas fa-heartbeat me-1 icon-primary"></i> Blood Pressure
                                        </label>
                                        <input type="text" name="blood_pressure" class="form-control"
                                            placeholder="e.g. 120/80" value="{{ old('blood_pressure') }}">

                                        @if(!empty($bpSuggestion))
                                            <div class="mt-2 p-2 rounded suggestion-box">
                                                <small class="text-muted d-block mb-1">
                                                    <i class="fas fa-stethoscope me-1 icon-primary"></i>
                                                    As per your age and gender:
                                                </small>
                                                <span class="fw-semibold">
                                                    Ideal Blood Pressure:
                                                    <span style="color: var(--primary);">{{ $bpSuggestion }}</span>
                                                </span>
                                            </div>
                                        @endif
                                    </div>

                                    <div class="col-md-4 mb-3">
                                        <label class="form-label fw-semibold text-secondary">
                                            <i class="fas fa-thermometer-half me-1 icon-warning"></i> Temperature (°F)
                                        </label>
                                        <input type="number" step="0.1" name="temperature" class="form-control"
                                            placeholder="e.g. 100" value="{{ old('temperature') }}">
                                    </div>

                                    <div class="col-md-4 mb-3">
                                        <label class="form-label fw-semibold text-secondary">
                                            <i class="fas fa-heart me-1 icon-danger"></i> Heart Rate (BPM)
                                        </label>
                                        <input type="number" name="heart_rate" class="form-control"
                                            placeholder="e.g. 72" value="{{ old('heart_rate') }}">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    {{-- Medical History --}}
                    <div class="mb-5">
                        <div class="form-section-title mb-3">Medical History</div>
                        <div class="card shadow-sm border-0">
                            <div class="card-body">
                                <p class="text-muted mb-4">
                                    Please select any medical conditions or relevant history that apply to you.
                                </p>
                                <div class="row gy-2 gx-4">
                                    <div class="col-md-6">
                                        @php
                                            $histories1 = ['Food Allergies', 'Drug Allergies', 'Asthma', 'Diabetes', 'Heart Disease', 'High Blood Pressure'];
                                        @endphp
                                        @foreach($histories1 as $item)
                                            <div class="form-check mb-2">
                                                <input class="form-check-input" type="checkbox" name="medical_history[]" value="{{ $item }}" id="{{ Str::slug($item) }}">
                                                <label class="form-check-label fw-medium" for="{{ Str::slug($item) }}">{{ $item }}</label>
                                            </div>
                                        @endforeach
                                    </div>

                                    <div class="col-md-6">
                                        @php
                                            $histories2 = ['Surgery History', 'Accident', 'Tendency to Bleed', 'Other'];
                                        @endphp
                                        @foreach($histories2 as $item)
                                            <div class="form-check mb-2">
                                                <input class="form-check-input" type="checkbox" name="medical_history[]" value="{{ $item }}" id="{{ Str::slug($item) }}">
                                                <label class="form-check-label fw-medium" for="{{ Str::slug($item) }}">{{ $item }} @if($item=='Other')(Specify Below)@endif</label>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                                <div class="mt-4">
                                    <textarea name="other_history" class="form-control shadow-sm" rows="3" placeholder="If other, please specify...">{{ old('other_history') }}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                    {{-- Female Section --}}
                    @if ($patientData->gender == 'Female')
                        <div class="mb-5">
                            <div class="form-section-title mb-3">Female Health (if applicable)</div>
                            <div class="card shadow-sm border-0 female-health-section">
                                <div class="card-body row">
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Pregnancy Status</label>
                                        <select class="form-select" name="pregnancy_status">
                                            <option value="">Select...</option>
                                            <option value="1">Pregnant</option>
                                            <option value="0">Not Pregnant</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label class="form-label">Breast Feeding</label>
                                        <select class="form-select" name="breast_feeding">
                                            <option value="">Select...</option>
                                            <option value="1">Yes</option>
                                            <option value="0">No</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endif

                    {{-- Submit --}}
                    <div class="text-center mt-5">
                        <button type="submit" class="btn btn-primary px-5 py-2">
                            <i class="fas fa-paper-plane me-2"></i>Submit Intake Form
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection