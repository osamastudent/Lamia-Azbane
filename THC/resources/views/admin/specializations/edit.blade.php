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

  textarea.form-control {
    resize: none;
  }

  .form-check-input {
    background-color: #0D1B2A;
    border: 1px solid #00B4D8;
  }

  .form-check-input:checked {
    background-color: #00B4D8;
    border-color: #00B4D8;
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
  <h3>Add New Specialization</h3>
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
  <form action="{{ route('admin.specializations.update' , $specialization->id) }}" method="POST">
      @csrf
      @method('PUT')
      <div class="row">
          <div class="col-md-6 mb-3">
              <label class="form-label">Name <span class="text-danger">*</span></label>
              <input type="text" name="name" class="form-control" value="{{$specialization->name}}" required>
          </div>

          <div class="col-md-6 mb-3">
              <label class="form-label">Status</label><br>
              <div class="form-check form-switch mt-2">
                  <input class="form-check-input" type="checkbox" name="is_active" {{ $specialization->is_active ? 'checked' : '' }}>
                  <label class="form-check-label" for="is_active">Active</label>
              </div>
          </div>
      </div>
      <div class="mb-3">
          <label class="form-label">Description</label>
          <textarea name="description" class="form-control" rows="3" placeholder="any description">{{$specialization->description}}</textarea>
      </div>

      <div class="text-end">
          <a href="{{ route('admin.specializations.index') }}" class="btn btn-secondary me-2">Cancel</a>
          <button type="submit" class="btn btn-primary">Save Specialization</button>
      </div>
  </form>
</div>
@endsection
