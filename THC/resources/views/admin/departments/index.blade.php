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

  .table thead {
      background-color: #0D1B2A;
      color: #00B4D8;
  }

  .table th, .table td {
      vertical-align: middle;
      border-top: 0;
  }

  .table tbody tr:hover {
      background-color: #23324A;
  }

  .badge-success {
      background-color: #00B894;
      color: #fff;
  }

  .badge-danger {
      background-color: #E63946;
      color: #fff;
  }

   .action-btn {
    font-size: 13px;
    padding: 5px 10px;
    border-radius: 6px;
    text-decoration: none;
    margin-right: 6px;
  }

  .edit-btn { background-color: #0077B6; color: #fff; }
  .edit-btn:hover { background-color: #0096C7; }

  .delete-btn { background-color: #E63946; color: #fff; border: none; }
  .delete-btn:hover { background-color: #B8323C; }
</style>

<div class="page-header">
    <h3>All Departments</h3>
    <a href="{{ route('admin.departments.create') }}" class="btn btn-primary">Add New Department</a>
</div>

<div class="card shadow-sm p-4 mt-4">
    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    <div class="table-responsive">
        <table class="table text-light">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Department Name</th>
                    <th>Specialization</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @forelse($departments as $department)
                    <tr id="spec-row-{{ $department->id }}">
                        <td>{{ $department->id }}</td>
                        <td>{{ $department->name }}</td>
                        <td>{{ $department->specialization_name ?? 'N/A' }}</td>
                        <td>
                            <a href="{{ route('admin.departments.edit', $department->id) }}" class="action-btn edit-btn"><i class="fas fa-edit"></i> Edit</a>
                            <form action="{{ route('admin.departments.destroy', $department->id) }}" method="POST" class="d-inline-block" onsubmit="return confirm('Are you sure to delete this department?');">
                                @csrf
                                @method('DELETE')
                                <button 
                                type="button" 
                                class="action-btn delete-btn delete-department"
                                data-id="{{ $department->id }}"
                                data-url="{{ route('admin.departments.destroy', $department->id) }}">
                                <i class="fas fa-trash"></i> Delete
                            </button>
                            </form>
                        </td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="5" class="text-center text-muted">No departments found.</td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    <div class="mt-3 d-flex justify-content-center">
        {{ $departments->links() }}
    </div>
</div>

{{-- âœ… SweetAlert + AJAX --}}
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
$(document).ready(function() {

    $(document).on('click', '.delete-department', function(e) {
        e.preventDefault();
        let btn = $(this);
        let id = btn.data('id');
        let url = btn.data('url');

        Swal.fire({
            title: 'Are you sure?',
            text: "This action cannot be undone!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#E63946',
            cancelButtonColor: '#00B4D8',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {
                        _token: "{{ csrf_token() }}",
                        _method: "DELETE"
                    },
                    success: function(res) {
                        if (res.success) {
                            $('#spec-row-' + id).fadeOut(400, function() { $(this).remove(); });
                            Swal.fire('Deleted!', 'Department deleted successfully.', 'success');
                        } else {
                            Swal.fire('Error!', 'Something went wrong.', 'error');
                        }
                    },
                    error: function() {
                        Swal.fire('Error!', 'Failed to delete Department.', 'error');
                    }
                });
            }
        });
    });
});
</script>
@endsection
