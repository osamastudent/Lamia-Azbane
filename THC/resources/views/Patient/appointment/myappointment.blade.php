@extends('Patient.layouts.master')

@section('content')
<style>
    /* Light Background */
    body {
        background-color: #f5f7fa !important;
        color: #2c3e50 !important;
        font-family: 'Poppins', sans-serif;
    }

    /* Card Styling */
    .custom-card {
        background: #fff;
        border: 1px solid #e5e9f2;
        border-radius: 16px;
        box-shadow: 0px 4px 15px rgba(0,0,0,0.05);
    }

    .custom-card-header {
        padding: 20px 25px;
        border-bottom: 1px solid #e5e9f2;
        background: #384959;
        border-radius: 16px 16px 0 0;
    }

    .custom-card-header h1 {
        font-size: 22px;
        font-weight: 600;
        color: white;
        margin: 0;
    }

    /* Table Wrapper */
    .table-wrapper {
        padding: 0;
        overflow-x: auto;
    }

  

    /* Status Badges */
    .badge-status {
        padding: .4em .7em;
        font-size: 0.75rem;
        font-weight: 700;
        border-radius: .5rem;
        text-transform: uppercase;
         display: inline-block;
        min-width: 90px;
         text-align: center;
         border: 1px solid transparent;
    }

    .green { background-color: #e9f9ef; color: #198754; border-color: #198754; } /* Success */
    .red { background-color: #fdeaea; color: #dc3545; border-color: #dc3545; } 
    .blue { background-color: #e7f1ff; color: #0d6efd; border-color: #0d6efd; }
    .yellow { background-color: #fff7df; color: #ffb200; border-color: #ffb200; } 

    /* View Button */
    .view-btn {
    background: #0d6efd;
    color: white;
    padding: 7px 16px;
    border-radius: 6px;
    font-size: 13px;
    font-weight: 500;
    text-decoration: none;
    transition: 0.2s;
    border: none;
    margin-right: 6px; /* ⭐ GAP ADDED HERE */
}

    .view-btn:hover {
        background: #0b5ed7;
        box-shadow: 0 2px 4px rgba(13,110,253,0.3);
    }

    /* Empty State */
    .empty-row {
        text-align: center;
        padding: 35px 0;
        font-size: 1rem;
        color: #6c7a91;
    }

    /* Pagination */
    .pagination {
        padding: 15px 10px;
    }
</style>

<div class="container-fluid my-4">

    <div class="card shadow border-o">
        <div class="card-header"> 

            <h1><i class="fas fa-calendar-alt me-2"></i> My Appointments</h1>
        </div>
        
        <div class="card-body">
                <div class="table-responsive table-wrapper">
            <table class="table table-hover align-middle mb-0 custom-table-appointments">
                <thead>
                    <tr>
                        <th>SN</th>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Doctor</th>
                        <th>Consultation Type</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($appointments as $index => $item)
                        @php
                            $statusText = $item->status ?? 'pending';
                            $statusClass = match ($statusText) {
                                'approved' => 'green',
                                'cancelled', 'Rejected' => 'red',
                                'completed' => 'blue',
                                default => 'yellow',
                            };
                        @endphp

                        <tr>
                            <td>{{ $appointments->firstItem() + $index }}</td>
                            <td>{{ $item->appointment_date }}</td>
                            <td>{{ $item->appointment_time }}</td>
                            <td>{{ $item->doctor_name }}</td>
                            <td>{{ ucfirst($item->consultation_type ?? 'N/A') }}</td>
                            <td>
                                <span class="badge-status {{ $statusClass }}">
                                    {{ ucfirst($statusText) }}
                                </span>
                            </td>
                            <td>
                                <a href="{{ route('patient.appointments.view', $item->id) }}" class="view-btn">
                                    View
                                </a>
                                @if ($item->status == 'completed')
                                    <a href="{{ route('patient.consultation.view', $item->id) }}" class="view-btn" style="background-color: #ff9900;">
                                        Note/Prescription
                                    </a>
                                @endif
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="7" class="empty-row">
                                <i class="fas fa-search me-2"></i> No appointments found.
                            </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
            </div>        

    

        <div class="pagination">
            {{ $appointments->links() }}
        </div>
    </div>

</div>
@endsection
