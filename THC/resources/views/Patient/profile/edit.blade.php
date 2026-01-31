@extends('Patient.layouts.master')
@section('title', 'Edit Profile')

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
                        <i class="fas fa-user-edit me-2"></i> Edit Profile
                    </h5>
                    <a href="{{ route('patient.profile.view') }}" class="btn btn-light btn-sm px-3 py-1 shadow-sm rounded-pill">
                        <i class="fas fa-arrow-left me-1"></i> Back
                    </a>
                </div>
 
                {{-- Body --}}
                <div class="card-body bg-light p-4">
                    <form action="{{ route('patient.profile.update', $patient->id) }}" method="POST" enctype="multipart/form-data">
                        @csrf

                        <div class="row g-3">
                            {{-- Name --}}
                            <div class="col-md-6">
                                <label for="name" class="form-label fw-semibold">Full Name</label>
                                <input type="text" name="name" id="name" 
                                       value="{{ old('name', $user->name) }}" 
                                       class="form-control rounded-3 @error('name') is-invalid @enderror">
                                @error('name')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                            
                            {{--father/husband Name --}}
                            <div class="col-md-6">
                                <label for="father_husband_name" class="form-label fw-semibold">Father/Husband Name</label>
                                <input type="text" name="father_husband_name" id="father_husband_name" 
                                       value="{{ old('father_husband_name', $user->father_husband_name) }}" 
                                       class="form-control rounded-3 @error('father_husband_name') is-invalid @enderror">
                                @error('father_husband_name')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>


                            {{-- Phone --}}
                            <div class="col-md-6">
                                <label for="phone" class="form-label fw-semibold">Phone</label>
                                <input type="text" name="phone" id="phone" 
                                       value="{{ old('phone', $patient->phone) }}" 
                                       class="form-control rounded-3 @error('phone') is-invalid @enderror">
                                @error('phone')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            {{-- Email --}}
                            <div class="col-md-6 mt-3">
                                <label for="email" class="form-label fw-semibold">Email</label>
                                <input type="email" name="email" id="email" 
                                       value="{{ old('email', $user->email) }}" 
                                       class="form-control rounded-3 @error('email') is-invalid @enderror">
                                @error('email')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                            {{-- age --}}
                            <div class="col-md-6 mt-3">
                                <label for="age" class="form-label fw-semibold">Age</label>
                                <input type="text" name="age" id="age" 
                                       value="{{ old('age', $patient->age) }}" 
                                       class="form-control rounded-3 @error('age') is-invalid @enderror">
                                @error('age')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                            {{-- dob --}}
                            <div class="col-md-6 mt-3">
                                <label for="age" class="form-label fw-semibold">DOB</label>
                                <input type="date" name="dob" id="dob" 
                                       value="{{ old('age', $user->dob) }}" 
                                       class="form-control rounded-3 @error('dob') is-invalid @enderror">
                                @error('dob')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                            {{-- Password --}}
                            <div class="col-md-6 mt-3">
                                <label for="password" class="form-label fw-semibold">Password</label>
                                <input type="password" name="password" id="password" 
                                       value="{{ old('password', $user->password) }}" 
                                       class="form-control rounded-3 @error('password') is-invalid @enderror">
                                @error('password')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>

                            {{-- Profile Image --}}
                            <div class="col-12 mt-3">
                                <label for="profile_image" class="form-label fw-semibold">Profile Image</label>
                                <input type="file" name="profile_image" id="profile_image" 
                                       class="form-control rounded-3 @error('profile_image') is-invalid @enderror">
                                @error('profile_image')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror

                                @if($patient->profile_image && file_exists(public_path('Patient/profile_images/'.$patient->profile_image)))
                                    <div class="mt-3">
                                        <img src="{{ asset('Patient/profile_images/'.$patient->profile_image) }}" 
                                             alt="Profile Image" class="rounded-circle border shadow" 
                                             style="width: 100px; height: 100px; object-fit: cover;">
                                    </div>
                                @endif
                            </div>
                        </div>

                        <div class="mt-4 text-end">
                            <button type="submit" class="btn btn-success px-4 py-2 rounded-pill shadow-sm">
                                <i class="fas fa-save me-1"></i> Save Changes
                            </button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
@endsection
