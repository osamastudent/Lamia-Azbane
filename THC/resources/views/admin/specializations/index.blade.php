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
  }
  .theme-table td {
    padding: 8px 12px;
    border-bottom: 1px solid rgba(255, 255, 255, 0.05);
    vertical-align: middle;
  }
  .theme-table tbody tr:hover {
    background-color: #23324A;
  }
  .badge {
    padding: 4px 8px;
    border-radius: 6px;
    font-size: 12px;
    font-weight: 500;
  }
  .bg-success { background-color: #00B894; color: white; }
  .bg-danger { background-color: #E63946; color: white; }

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

  .status-btn {
    cursor: pointer;
    padding: 5px 10px;
    border-radius: 6px;
    font-size: 12px;
    border: none;
  }
  .status-btn.active { background-color: #00B894; color: white; }
  .status-btn.inactive { background-color: #E63946; color: white; }
</style>

<div class="page-header">
  <h1>All Specializations</h1>
  <a href="{{ route('admin.specializations.create') }}" class="add-btn">
    <i class="fas fa-plus-circle me-1"></i> Add Specialization
  </a>
</div>

<div class="table-container">
  <table class="table theme-table">
    <thead>
      <tr>
        <th>#</th>
        <th>Name</th>
        <th>Description</th>
        <th>Status</th>
        <th>Created At</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
      @forelse($specializations as $index => $spec)
      <tr id="spec-row-{{ $spec->id }}">
        <td>{{ $index + 1 }}</td>
        <td>{{ $spec->name }}</td>
        <td>{{ $spec->description ?? '—' }}</td>
        <td id="status-cell-{{ $spec->id }}">
          @if($spec->is_active)
            <span class="badge bg-success">Active</span>
          @else
            <span class="badge bg-danger">Inactive</span>
          @endif
        </td>
        <td>{{ $spec->created_at->format('d M, Y') }}</td>
        <td>
          <button 
            type="button"
            class="status-btn {{ $spec->is_active ? 'active' : 'inactive' }}" 
            data-id="{{ $spec->id }}">
            {{ $spec->is_active ? 'Deactivate' : 'Activate' }}
          </button>

          <a href="{{ route('admin.specializations.edit', $spec->id) }}" class="action-btn edit-btn">
            <i class="fas fa-edit"></i> Edit
          </a>

          <button 
            type="button" 
            class="action-btn delete-btn delete-specialization" 
            data-id="{{ $spec->id }}" 
            data-url="{{ route('admin.specializations.destroy', $spec->id) }}">
            <i class="fas fa-trash"></i> Delete
          </button>
        </td>
      </tr>
      @empty
      <tr>
        <td colspan="6" class="text-center text-muted py-4">No specializations found.</td>
      </tr>
      @endforelse
    </tbody>
  </table>
</div>

{{-- ✅ SweetAlert + AJAX --}}
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
$(document).ready(function() {

    // 🔹 Toggle Status
    $(document).on('click', '.status-btn', function(e) {
        e.preventDefault();
        let btn = $(this);
        let id = btn.data('id');

        $.ajax({
            url: "{{ route('admin.specializations.toggleStatus') }}",
            type: "POST",
            data: {
                _token: "{{ csrf_token() }}",
                id: id
            },
            success: function(res) {
                if (res.success) {
                    let cell = $('#status-cell-' + id);
                    if (res.is_active) {
                        btn.removeClass('inactive').addClass('active').text('Deactivate');
                        cell.html('<span class="badge bg-success">Active</span>');
                        Swal.fire('Activated!', 'Status updated successfully.', 'success');
                    } else {
                        btn.removeClass('active').addClass('inactive').text('Activate');
                        cell.html('<span class="badge bg-danger">Inactive</span>');
                        Swal.fire('Deactivated!', 'Status updated successfully.', 'info');
                    }
                }
            },
            error: function() {
                Swal.fire('Error!', 'Failed to update status.', 'error');
            }
        });
    });

    // 🔹 Delete
    $(document).on('click', '.delete-specialization', function(e) {
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
                            Swal.fire('Deleted!', 'Specialization deleted successfully.', 'success');
                        } else {
                            Swal.fire('Error!', 'Something went wrong.', 'error');
                        }
                    },
                    error: function() {
                        Swal.fire('Error!', 'Failed to delete specialization.', 'error');
                    }
                });
            }
        });
    });
});
</script>
@endsection
