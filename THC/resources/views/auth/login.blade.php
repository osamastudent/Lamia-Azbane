@extends('layouts.app')

@section('content')
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
    crossorigin="anonymous">

<style>
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
        background-color: #f2f6fc;
        font-family: 'Poppins', sans-serif;
        overflow: hidden; /* Prevent scrolling */
    }

    .full-height-container {
        height: 91vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .login-card {
        background: #ffffff;
        border: 1px solid #e0e6ed;
        border-radius: 15px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
        padding: 40px 35px;
        width: 100%;
        max-width: 480px;
        transition: all 0.3s ease;
    }

    .login-card:hover {
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

    .form-control {
        border-radius: 10px;
        border: 1px solid #ccd6e0;
        transition: border-color 0.2s, box-shadow 0.2s;
    }

    .form-control:focus {
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

    .form-check-label {
        font-weight: 500;
    }

    .text-center a {
        color: #1a73e8;
        text-decoration: none;
    }

    .text-center a:hover {
        text-decoration: underline;
    }
</style>

<div class="full-height-container">
    <div class="login-card">
        <h3>🔑 Login to Your Account</h3>
        <hr>

        <form method="POST" action="{{ route('login') }}">
            @csrf

            {{-- Email --}}
            <div class="mb-3">
                <label for="email" class="form-label">Email Address *</label>
                <input id="email" type="email"
                    class="form-control @if(session('emailError')) is-invalid @endif"
                    name="email" value="{{ old('email') }}"  autocomplete="email" autofocus
                    placeholder="Enter your email">
                    @error('email')
                         <small class="text-danger d-block mt-1">{{ $message }}</small>
                    @enderror
                @if (session('emailError'))
                     <small class="text-danger d-block mt-1">{{ session('emailError') }}</small>
                @endif
            </div>

            {{-- Password --}}
            <div class="mb-3">
                <label for="password" class="form-label">Password *</label>
                <input id="password" type="password"
                    class="form-control @if(session('passwordError')) is-invalid @endif"
                    name="password"  autocomplete="current-password"
                    placeholder="Enter your password">
                     @error('password')
                         <small class="text-danger d-block mt-1">{{ $message }}</small>
                    @enderror
                @if (session('passwordError'))
                <small class="text-danger">{{ session('passwordError') }}</small>
                 @endif
            </div>

            {{-- Remember Me --}}
            <div class="mb-3 form-check">
                <input class="form-check-input" type="checkbox" name="remember" id="remember"
                    {{ old('remember') ? 'checked' : '' }}>
                <label class="form-check-label" for="remember">Remember Me</label>
            </div>

            {{-- Submit --}}
            <div class="text-center">
                <button type="submit" class="btn btn-primary px-5">Login</button>
            </div>

            {{-- Forgot Password --}}
            <div class="text-center mt-3">
                @if (Route::has('password.request'))
                    <a href="{{ route('password.request') }}">Forgot Your Password?</a>
                @endif
            </div>

            <hr class="my-4">

            <div class="text-center">
                <p class="mb-2">Don’t have an account?</p>
                <a href="{{ route('register') }}" class="btn btn-outline-primary">Create Account</a>
            </div>
        </form>
    </div>
</div>
@endsection
