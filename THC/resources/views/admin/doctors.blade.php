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

 .page-header h1 {
  font-weight: 600;
  margin: 0;
  background: linear-gradient(90deg, #48CAE4, #7B2FF7);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}


  .page-header .actions {
    display: flex;
    align-items: center;
    gap: 10px;
  }

  .search-box {
    position: relative;
  }

  .search-box input {
    padding: 8px 35px 8px 12px;
    border-radius: 8px;
    border: 1px solid #00B4D8;
    background-color: #0D1B2A;
    color: #E0E6ED;
    outline: none;
    width: 220px;
  }

  .search-box i {
    position: absolute;
    right: 10px;
    top: 8px;
    color: #00B4D8;
  }

  .add-btn {
    background-color: #00B4D8;
    color: #fff;
    border: none;
    padding: 8px 16px;
    border-radius: 8px;
    font-size: 14px;
    font-weight: 500;
    transition: 0.3s ease;
    text-decoration: none;
  }

  .add-btn:hover {
    background-color: #0096C7;
    transform: translateY(-1px);
    box-shadow: 0 0 10px rgba(0,180,216,0.5);
  }

  .table-container {
    overflow-x: auto;
    background-color: #1B263B;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.3);
    padding: 15px;
  }

  .theme-table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0;
    color: #E0E6ED;
    font-size: 14px;
  }

  .theme-table thead {
    background-color: #0D1B2A;
  }

  .theme-table th {
    color: #00B4D8;
    font-weight: 600;
    text-transform: uppercase;
    padding: 10px 12px;
    border-bottom: 2px solid #00B4D8;
    white-space: nowrap;
  }

  .theme-table td {
    padding: 8px 12px;
    border-bottom: 1px solid rgba(255, 255, 255, 0.05);
    vertical-align: middle;
  }

  .theme-table tbody tr:hover {
    background-color: #23324A;
  }

  .theme-table img {
    width: 45px;
    height: 45px;
    border-radius: 50%;
    border: 1px solid #00B4D8;
    object-fit: cover;
  }

  .badge {
    padding: 4px 8px;
    border-radius: 6px;
    font-size: 12px;
    font-weight: 500;
  }

  .bg-success {
    background-color: #00B894;
    color: white;
  }

  .bg-danger {
    background-color: #E63946;
    color: white;
  }

  .action-btn {
    font-size: 13px;
    padding: 5px 10px;
    border-radius: 6px;
    transition: all 0.3s ease;
    text-decoration: none;
    margin-right: 6px;
  }

  .action-btn:hover {
    transform: scale(1.05);
    box-shadow: 0 0 8px rgba(0, 180, 216, 0.5);
  }

  @media (max-width: 768px) {
    .page-header {
      flex-direction: column;
      align-items: flex-start;
      gap: 10px;
    }
    .search-box input {
      width: 100%;
    }
  }
</style>

<div class="page-header">
  <h1>All Doctors</h1>

  <div class="actions">
    <div class="search-box">
      <form method="GET" action="{{ route('admin.doctors') }}">
        <input type="text" name="search" value="{{ request('search') }}" placeholder="Search doctor...">
        <i class="fas fa-search"></i>
      </form>
    </div>
    <a href="" class="add-btn">
      <i class="fas fa-user-plus me-1"></i> Add Doctor
    </a>
  </div>
</div>

<div class="table-container">
  <table class="table theme-table">
    <thead>
      <tr>
        <th>#</th>
        <th>Dr Name</th>
        <th>Profile</th>
        <th>Gender</th>
        <th>Phone</th>
        <th>Address</th>
        <th>Qualification</th>
        <th>Specialization</th>
        <th>Department</th>
        <th>Hospital</th>
        <th>Experience</th>
        <!--<th>Days</th>-->
        <!--<th>Start</th>-->
        <!--<th>End</th>-->
        <th>Status</th>
        <th>Approval</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
      @forelse ($doctorData as $doctor)
      <tr>
        <td>{{ $doctor->id }}</td>
        <td>{{ $doctor->name }}</td>
        <td>
          @php $imagePath = 'uploads/doctor/profile_images/' . $doctor->profile_image; @endphp
          @if ($doctor->profile_image && file_exists(public_path($imagePath)))
            <img src="{{ asset($imagePath) }}" alt="Profile">
          @else
            <img src="{{ asset('images/default-avatar.png') }}" alt="No Image">
          @endif
        </td>
        <td>{{ $doctor->gender }}</td>
        <td>{{ $doctor->phone }}</td>
        <td>{{ $doctor->address }}</td>
        <td>{{ $doctor->qualification }}</td>
        <td>{{ $doctor->specialization }}</td>
        <td>{{ $doctor->department }}</td>
        <td>{{ $doctor->hospital_name }}</td>
        <td>{{ $doctor->experience_years }}</td>
        {{--<td>
          @php
            $days = json_decode($doctor->available_days, true);
            echo is_array($days) ? implode(', ', $days) : $doctor->available_days;
          @endphp
        </td>
        <td>{{ $doctor->available_time_start ? date('h:i A', strtotime($doctor->available_time_start)) : 'N/A' }}</td>
        <td>{{ $doctor->available_time_end ? date('h:i A', strtotime($doctor->available_time_end)) : 'N/A' }}</td> --}}
        <td>{{ $doctor->status }}</td>
        <td>
          @if ($doctor->is_approved == 0)
            <span class="badge bg-danger">Not Approved</span>
          @else
            <span class="badge bg-success">Approved</span>
          @endif
        </td>
        <td>
          @if ($doctor->is_approved == 0)
            <a href="{{ route('admin.doctor.approved', $doctor->id) }}" class="btn btn-success btn-sm action-btn approve-btn"
               >Approve</a>
          @else
            <a href="{{ route('admin.doctor.cancel', $doctor->id) }}" class="btn btn-danger btn-sm action-btn revoke-btn"
               >Revoke</a>
          @endif
        </td>
      </tr>
      @empty
      <tr>
        <td colspan="17" class="text-center text-muted py-4">No doctors found.</td>
      </tr>
      @endforelse
    </tbody>
  </table>

  <div class="mt-3 d-flex justify-content-center">
    {{ $doctorData->links() }}
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
  // Approve confirmation
  document.querySelectorAll('.approve-btn').forEach(button => {
    button.addEventListener('click', function (e) {
      e.preventDefault();
      const url = this.getAttribute('href');

      Swal.fire({
        title: 'Approve Doctor?',
        text: "Do you really want to approve this doctor?",
        icon: 'question',
        showCancelButton: true,
        confirmButtonColor: '#00B4D8',
        cancelButtonColor: '#E63946',
        confirmButtonText: 'Yes, Approve',
      }).then((result) => {
        if (result.isConfirmed) {
          window.location.href = url;
        }
      });
    });
  });

  // Revoke confirmation
  document.querySelectorAll('.revoke-btn').forEach(button => {
    button.addEventListener('click', function (e) {
      e.preventDefault();
      const url = this.getAttribute('href');

      Swal.fire({
        title: 'Revoke Approval?',
        text: "This doctor will no longer be approved.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#E63946',
        cancelButtonColor: '#00B4D8',
        confirmButtonText: 'Yes, Revoke',
      }).then((result) => {
        if (result.isConfirmed) {
          window.location.href = url;
        }
      });
    });
  });

  // Success message from session
  @if(session('success'))
    Swal.fire({
      icon: 'success',
      title: 'Success!',
      text: '{{ session('success') }}',
      confirmButtonColor: '#00B4D8'
    });
  @endif

  // Error message from session
  @if(session('error'))
    Swal.fire({
      icon: 'error',
      title: 'Error!',
      text: '{{ session('error') }}',
      confirmButtonColor: '#E63946'
    });
  @endif
</script>



@endsection
