@extends('layouts.app')

@section('content')
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
    crossorigin="anonymous">
<!-- Include Select2 CSS -->
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<style>
    body {
        background-color: #f2f6fc;
        font-family: 'Poppins', sans-serif;
    }

    .registration-card {
        background: #ffffff;
        border: 1px solid #e0e6ed;
        border-radius: 15px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        padding: 40px 35px;
        margin-top: 60px;
        transition: all 0.3s ease;
    }

    .registration-card:hover {
        box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
        transform: translateY(-2px);
    }

    h3 {
        color: #1a237e;
        font-weight: 600;
        text-align: center;
        margin-bottom: 10px;
    }

    .form-label {
        font-weight: 500;
        color: #333;
    }

    .form-control,
    .form-select,
    textarea {
        border-radius: 10px;
        border: 1px solid #ccd6e0;
        transition: border-color 0.2s, box-shadow 0.2s;
    }

    .form-control:focus,
    .form-select:focus,
    textarea:focus {
        border-color: #1a73e8;
        box-shadow: 0 0 0 0.15rem rgba(26, 115, 232, 0.25);
    }

    .btn-primary {
        background-color: #1a73e8;
        border: none;
        border-radius: 10px;
        padding: 10px 25px;
        font-weight: 500;
        transition: all 0.3s ease;
    }

    .btn-primary:hover {
        background-color: #155fc0;
        transform: translateY(-2px);
    }

    small.text-danger {
        font-size: 0.85rem;
    }

    hr {
        border-top: 2px solid #e0e6ed;
        margin-bottom: 25px;
    }

</style>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="registration-card">
                <h3><i class="fas fa-user-md"></i> Doctor Registration</h3>

                <hr>

                <form method="POST" action="{{ route('doctor.register.post') }}" enctype="multipart/form-data">
                    @csrf

                    <div class="row">
                        {{-- First Name --}}
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Your Full Name *</label>
                            <input type="text" name="name" class="form-control"
                                placeholder="Enter first name" value="{{ old('name') }}" required>
                            @error('name') <small class="text-danger">{{ $message }}</small> @enderror
                        </div>

                        {{-- Last Name --}}
                        <div class="col-md-4 mb-3">
                            <label for="father_husband_name" class="form-label">Father/Husband Name *</label>
                            <input type="text" name="father_husband_name" class="form-control"
                                placeholder="Enter last name" value="{{ old('father_husband_name') }}" required>
                            @error('father_husband_name') <small class="text-danger">{{ $message }}</small> @enderror
                        </div>

                         {{-- DOB --}}
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Date of Birth *</label>
                            <input type="date" name="dob" class="form-control"
                                value="{{ old('dob') }}" required>
                            @error('dob') <small class="text-danger">{{ $message }}</small> @enderror
                        </div>

                    </div>

                    <div class="row">

                        {{-- Gender --}}
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Gender *</label>
                            <select name="gender" class="form-select" required>
                                <option value="">Select</option>
                                <option value="Male" {{ old('gender') == 'Male' ? 'selected' : '' }}>Male</option>
                                <option value="Female" {{ old('gender') == 'Female' ? 'selected' : '' }}>Female</option>
                                <option value="Other" {{ old('gender') == 'Other' ? 'selected' : '' }}>Other</option>
                            </select>
                            @error('gender') <small class="text-danger">{{ $message }}</small> @enderror
                        </div>

                        {{-- Phone --}}
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Phone *</label>
                            <input type="text" name="phone" class="form-control"
                                placeholder="Enter phone number" value="{{ old('phone') }}" required>
                            @error('phone') <small class="text-danger">{{ $message }}</small> @enderror
                        </div>

                        {{-- Email --}}
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Email *</label>
                            <input id="email" type="email" class="form-control @error('email') is-invalid @enderror"
                                name="email" value="{{ old('email') }}" required autocomplete="email"
                                placeholder="Enter email">
                            @error('email')
                            <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <label class="form-label">Address *</label>
                            <textarea id="address"
                                    class="form-control @error('address') is-invalid @enderror"
                                    name="address"
                                    rows="3"
                                    required
                                    placeholder="Enter your full address">{{ old('address') }}</textarea>
                            @error('address')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                    </div>



                    <div class="row">
                        {{-- Password --}}
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Password *</label>
                            <input id="password" type="password"
                                class="form-control @error('password') is-invalid @enderror" name="password"
                                required autocomplete="new-password" placeholder="Enter password">
                            @error('password')
                            <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>

                        {{-- Confirm Password --}}
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Confirm Password *</label>
                            <input id="password-confirm" type="password" class="form-control"
                                name="password_confirmation" required autocomplete="new-password"
                                placeholder="Confirm password">
                        </div>
                    </div>

                    <div class="row">

                        {{-- qualification --}}
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Qualification *</label>
                            <select name="qualification" class="form-select" required>
                                <option value="">Select</option>
                                <option value="MBBS" {{ old('qualification') == 'MBBS' ? 'selected' : '' }}>MBBS</option>
                                <option value="BDS" {{ old('qualification') == 'BDS' ? 'selected' : '' }}>BDS</option>
                                <option value="MD" {{ old('qualification') == 'MD' ? 'selected' : '' }}>MD</option>
                                <option value="MS" {{ old('qualification') == 'MS' ? 'selected' : '' }}>MS</option>
                                <option value="FCPS" {{ old('qualification') == 'FCPS' ? 'selected' : '' }}>FCPS</option>
                                <option value="MCPS" {{ old('qualification') == 'MCPS' ? 'selected' : '' }}>MCPS</option>
                                <option value="DCH" {{ old('qualification') == 'DCH' ? 'selected' : '' }}>DCH</option>
                                <option value="DGO" {{ old('qualification') == 'DGO' ? 'selected' : '' }}>DGO</option>
                                <option value="DO" {{ old('qualification') == 'DO' ? 'selected' : '' }}>DO</option>
                                <option value="DPM" {{ old('qualification') == 'DPM' ? 'selected' : '' }}>DPM</option>
                                <option value="PhD" {{ old('qualification') == 'PhD' ? 'selected' : '' }}>PhD</option>
                            </select>
                            @error('qualification') <small class="text-danger">{{ $message }}</small> @enderror
                        </div>
                        {{-- specialization --}}
                        <div class="col-md-4 mb-3">
                            <label class="form-label">Specialization *</label>
                           <select name="specialization" id="specialization" class="form-select" required>
                            <option value="">Select Specialization</option>
                            @foreach ($specializations as $spec)
                                <option value="{{ $spec->name }}" {{ old('specialization') == $spec->name ? 'selected' : '' }}>
                                    {{ $spec->name }}
                                </option>
                            @endforeach
                        </select>

                            @error('specialization') 
                                <small class="text-danger">{{ $message }}</small> 
                            @enderror
                        </div>

                        {{-- department --}}
                        <div class="col-md-4 mb-3">
                            <label class="form-label">department *</label>
                            <select name="department" id="department" class="form-select" required>
                            <option value="">Select Department</option>
                            @foreach($department as $depart)
                                <option value="{{ $depart->name }}" {{ old('department') == $depart->name ? 'selected' : '' }}>
                                    {{ $depart->name }}
                                </option>
                            @endforeach
                        </select>

                            @error('department') <small class="text-danger">{{ $message }}</small> @enderror
                        </div>




                    </div>

                    <div class="row">
                        {{-- hospital_name --}}
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Hospital Name *</label>
                            <input id="hospital_name" type="text"
                                class="form-control @error('hospital_name') is-invalid @enderror" name="hospital_name"
                                required placeholder="Enter Hospital name">
                            @error('hospital_name')
                            <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        {{-- experience_years --}}
                        <div class="col-md-6 mb-3">
                            <label class="form-label">Experience years *</label>
                            <input id="experience_years" type="text"
                                class="form-control @error('experience_years') is-invalid @enderror" name="experience_years"
                                required placeholder="Enter Experience">
                            @error('experience_years')
                            <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>

                    </div>

                        <div class="row">
                        <!--    <div class="col-md-4 mb-3">-->
                        <!--        <label for="available_days" class="form-label">Available Days *</label>-->
                        <!--        <select name="available_days[]" id="available_days" class="form-select select2" multiple required>-->
                        <!--            <option value="Monday"  {{ old('available_days') == 'Monday' ? 'selected' : '' }}>Monday</option>-->
                        <!--            <option value="Tuesday" {{ old('available_days') == 'Tuesday' ? 'selected' : '' }}>Tuesday</option>-->
                        <!--            <option value="Wednesday" {{ old('available_days') == 'Wednesday' ? 'selected' : '' }}>Wednesday</option>-->
                        <!--            <option value="Thursday" {{ old('available_days') == 'Thursday' ? 'selected' : '' }}>Thursday</option>-->
                        <!--            <option value="Friday" {{ old('available_days') == 'Friday' ? 'selected' : '' }}>Friday</option>-->
                        <!--            <option value="Saturday" {{ old('available_days') == 'Saturday' ? 'selected' : '' }}>Saturday</option>-->
                        <!--            <option value="Sunday" {{ old('available_days') == 'Sunday' ? 'selected' : '' }}>Sunday</option>-->
                        <!--        </select>-->
                        <!--    </div>-->

                        <!--    {{-- available_time_start --}}-->
                        <!--<div class="col-md-4 mb-3">-->
                        <!--    <label class="form-label">Time Start *</label>-->
                        <!--    <input id="available_time_start" type="time"-->
                        <!--        class="form-control @error('available_time_start') is-invalid @enderror" name="available_time_start"-->
                        <!--        required placeholder="Enter available time">-->
                        <!--    @error('available_time_start')-->
                        <!--    <small class="text-danger">{{ $message }}</small>-->
                        <!--    @enderror-->
                        <!--</div>-->
                        <!--    {{-- available_time_end --}}-->
                        <!--<div class="col-md-4 mb-3">-->
                        <!--    <label class="form-label">Time End *</label>-->
                        <!--    <input id="available_time_end" type="time"-->
                        <!--        class="form-control @error('available_time_end') is-invalid @enderror" name="available_time_end"-->
                        <!--        required placeholder="Enter end time">-->
                        <!--    @error('available_time_end')-->
                        <!--    <small class="text-danger">{{ $message }}</small>-->
                        <!--    @enderror-->
                        <!--</div>-->

                             {{-- Address --}}
                        <div class="col-md-12 mb-3">
                            <label class="form-label">Profile Image</label>
                            <input type="file" name="profile_image" class="form-control" accept="image/*">
                            @error('profile_image') <small class="text-danger">{{ $message }}</small> @enderror
                        </div>
                        </div>





                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-primary px-5">Register</button>
                    </div>

                </form>
                <hr class="my-5">
                <div class="text-center">
                   <p class="text-dark fw-bold mb-3">Already have an account?</p>
                    <a href="{{ route('login') }}" class="btn btn-primary"> <i class="fas fa-user-md me-2"></i>Login</a>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- Include jQuery + Select2 JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<script>
$(document).ready(function() {
    $('#available_days').select2({
        placeholder: "Select available days",
        allowClear: true,
        width: '100%',
        tags: true // allows creating new tags too if needed
    });
});
</script>
@endsection
