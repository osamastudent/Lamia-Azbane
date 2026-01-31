@extends('admin.layouts.master')

@section('content')
<style>
  body {
      background-color: #0D1B2A;
      color: #E0E6ED;
      font-family: 'Poppins', sans-serif;
  }

  .page-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: #1B263B;
      padding: 15px 25px;
      border-radius: 10px;
      box-shadow: 0 3px 10px rgba(0,0,0,0.3);
      margin-bottom: 25px;
  }

  .page-header h3 {
      font-weight: 600;
      margin: 0;
      background: linear-gradient(90deg, #48CAE4, #7B2FF7);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
  }

  .card {
      background-color: #1B263B;
      border: none;
      border-radius: 10px;
      color: #E0E6ED;
  }

  .form-label {
      font-weight: 500;
      color: #90E0EF;
  }

  .form-control {
      background-color: #0D1B2A;
      border: 1px solid #00B4D8;
      color: #E0E6ED;
      border-radius: 8px;
  }

  .form-control:focus {
      border-color: #48CAE4;
      box-shadow: 0 0 8px rgba(0,180,216,0.5);
  }

  .btn-primary {
      background-color: #00B4D8;
      border: none;
      font-weight: 500;
      padding: 8px 16px;
      border-radius: 8px;
      transition: 0.3s ease;
  }

  .btn-primary:hover {
      background-color: #0096C7;
      transform: translateY(-1px);
      box-shadow: 0 0 10px rgba(0,180,216,0.6);
  }

  .btn-secondary {
      background-color: #415A77;
      color: #E0E6ED;
      border: none;
      font-weight: 500;
      border-radius: 8px;
  }

  .btn-secondary:hover {
      background-color: #2E4A62;
  }

  .alert {
      border-radius: 8px;
      border: none;
  }

  .alert-success {
      background-color: #00B894;
      color: white;
  }

  .alert-danger {
      background-color: #E63946;
      color: white;
  }
</style>

<div class="page-header">
  <h3>Edit Department</h3>
</div>

<div class="card shadow-sm p-4 mt-4">
    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    @if($errors->any())
        <div class="alert alert-danger">
            <ul class="mb-0">
                @foreach($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <form action="{{ route('admin.departments.update', $department->id) }}" method="POST">
        @csrf
        @method('PUT')

        <div class="mb-3">
            <label for="name" class="form-label">Department Name <span class="text-danger">*</span></label>
            <input type="text" name="name" class="form-control" id="name" value="{{ old('name', $department->name) }}" required>
        </div>

        <div class="mb-3">
            <label for="specialization_id" class="form-label">Specialization <span class="text-danger">*</span></label>
            <select name="specialization_id" id="specialization_id" class="form-control" required>
                <option value="">Select Specialization</option>
                @foreach($specializations as $specialization)
                    <option value="{{ $specialization->id }}" {{ $department->specialization_id == $specialization->id ? 'selected' : '' }}>
                        {{ $specialization->name }}
                    </option>
                @endforeach
            </select>
        </div>

        <div class="text-end">
            <a href="{{ route('admin.departments.index') }}" class="btn btn-secondary me-2">Cancel</a>
            <button type="submit" class="btn btn-primary">Update Department</button>
        </div>
    </form>
</div>
@endsection
