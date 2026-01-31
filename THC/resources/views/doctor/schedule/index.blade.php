@extends('doctor.layouts.master')

@section('content')
<div class="container-fluid py-4">

    <!-- Page Header -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-white py-3">
                    <h3 class="mb-0"
                        style="font-size: 32px; font-weight: bold; color: black;">
                        Existing Doctor Schedules
                    </h3>
                </div>

                <!-- Table Section -->
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover align-middle text-dark">
                            <thead class="table-light">
                                <tr class="text-dark">
                                    <th>Sno</th>
                                    <th>Type</th>
                                    <th>Day / Date</th>
                                    <th>Start Time</th>
                                    <th>End Time</th>
                                    <th>Available</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($schedules as $index => $schedule)
                                <tr>
                                    <td>{{ $index + 1 }}</td>

                                    <td>{{ ucfirst($schedule->type) }}</td>

                                    <td>
                                        @if($schedule->type === 'recurring')
                                            {{ $schedule->day_of_week }}
                                        @else
                                            {{ $schedule->date }}
                                        @endif
                                    </td>

                                    <td>{{ \Carbon\Carbon::parse($schedule->start_time)->format('h:i A') }}</td>
                                    <td>{{ \Carbon\Carbon::parse($schedule->end_time)->format('h:i A') }}</td>

                                    <td>
                                        @if($schedule->is_available)
                                            <span class="badge bg-success" style="color:white; font-size: 14px;">Yes</span>
                                        @else
                                            <span class="badge bg-danger" style="color:white; font-size: 14px;">No</span>
                                        @endif
                                    </td>

                                    <td>
                                        <div class="d-flex gap-2 align-items-center">
                                    
                                            <a href="{{ route('doctor.schedule.edit', $schedule->id) }}"
                                               class="btn btn-sm btn-info text-white">
                                                Edit
                                            </a>
                                    
                                            <form action="{{ route('doctor.schedule.destroy', $schedule->id) }}"
                                                  method="POST"
                                                  onsubmit="return confirm('Are you sure you want to delete this schedule?');">
                                                @csrf
                                                @method('DELETE')
                                    
                                                <button type="submit" class="btn btn-sm btn-danger">
                                                    Delete
                                                </button>
                                            </form>
                                    
                                        </div>
                                    </td>

                                </tr>

                                @empty
                                <tr>
                                    <td colspan="7" class="text-center py-3">No schedules found.</td>
                                </tr>
                                @endforelse
                            </tbody>

                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
@endsection
