@extends('doctor.layouts.master')

@section('content')

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            @if(session('success'))
                <div class="alert alert-success">{{ session('success') }}</div>
            @endif

            <div class="card shadow">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0">My Profile</h4>
                </div>

                <div class="card-body">
                    <form action="{{ route('doctor.profile.update') }}" method="POST">
                        @csrf

                        <div class="mb-3">
                            <label class="form-label">Name</label>
                            <input type="text" name="name" value="{{ $user->name }}" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" value="{{ $user->email }}" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">New Password (optional)</label>
                            <input type="password" name="password" class="form-control">
                            <small class="text-muted">Leave blank if you don’t want to change it.</small>
                        </div>

                        <button class="btn btn-primary w-100">Update Profile</button>

                    </form>

                </div>
            </div>

        </div>
    </div>
</div>

@endsection
