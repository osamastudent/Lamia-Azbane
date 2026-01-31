@extends('layouts.app')

@section('content')
<div class="container d-flex justify-content-center align-items-center" style="min-height: 80vh;">
    <div class="card shadow p-5 text-center" style="max-width: 500px;">
        <i class="fas fa-hourglass-half fa-3x text-warning mb-3"></i>
        <h3 class="text-dark mb-3">Your Application Is Under Review</h3>
        <p class="text-muted">
            Thank you for registering with our platform.
            Your doctor profile is currently under review by our administration team.
            Once your application is approved, you will gain full access to the doctor dashboard.
        </p>
        <a href="{{ route('logout') }}"
           class="btn btn-secondary mt-3"
           onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
           Logout
        </a>
        <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
            @csrf
        </form>
    </div>
</div>
@endsection
