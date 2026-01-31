@extends('doctor.layouts.master')

@section('content')
<div class="container my-5">

    <!-- Card -->
    <div class="card shadow-lg rounded-4 bg-white">
        <div class="card-header text-center py-4 bg-white border-bottom">
            <h2 class="mb-0" style="background: linear-gradient(90deg, #48CAE4, #7B2FF7); -webkit-background-clip: text; -webkit-text-fill-color: transparent;">
                Create Doctor Schedule
            </h2>
        </div>
        <div class="card-body p-5">

            <!-- Form -->
            <form action="{{ route('doctor.schedule.store') }}" method="POST">
                @csrf

                <!-- Schedule Type -->
                <div class="mb-4">
                    <label for="type" class="form-label fs-5 fw-semibold text-dark">Schedule Type</label>
                    <select name="type" id="type" class="form-select form-select-lg">
                        <option value="">-- Select Type --</option>
                        <option value="recurring">Recurring</option>
                        <option value="oneoff">One-off</option>
                    </select>
                </div>

                <!-- Day of Week -->
                <div class="mb-4" id="day_of_week_div" style="display:none;">
                    <label for="day_of_week" class="form-label fs-5 fw-semibold text-dark">Day of Week</label>
                    <select name="day_of_week" id="day_of_week" class="form-select form-select-lg">
                        @foreach($daysOfWeek as $day)
                            <option value="{{ $day }}">{{ $day }}</option>
                        @endforeach
                    </select>
                </div>

                <!-- Date -->
                <div class="mb-4" id="date_div" style="display:none;">
                    <label for="date" class="form-label fs-5 fw-semibold text-dark">Date</label>
                    <input type="date" name="date" id="date" class="form-control form-control-lg">
                </div>

                <!-- Start Time -->
                <div class="mb-4">
                    <label for="start_time" class="form-label fs-5 fw-semibold text-dark">Start Time</label>
                    <input type="time" name="start_time" id="start_time" class="form-control form-control-lg" required>
                </div>

                <!-- End Time -->
                <div class="mb-4">
                    <label for="end_time" class="form-label fs-5 fw-semibold text-dark">End Time</label>
                    <input type="time" name="end_time" id="end_time" class="form-control form-control-lg" required>
                </div>

                <!-- Submit -->
                <button type="submit" class="btn btn-lg w-100 text-white" style="background: linear-gradient(90deg, #48CAE4, #7B2FF7); border-radius: 30px;">
                    Save Schedule
                </button>
            </form>

        </div>
    </div>
</div>
@if(session('success'))
<script>
Swal.fire({
    icon: 'success',
    title: 'Success!',
    text: "{{ session('success') }}",
    showConfirmButton: false,
    timer: 2500,
    timerProgressBar: true,
    background: '#ffffff',
    color: '#333',
});
</script>
@endif

<script>
    const typeSelect = document.getElementById('type');
    const dayDiv = document.getElementById('day_of_week_div');
    const dateDiv = document.getElementById('date_div');

    typeSelect.addEventListener('change', function() {
        if(this.value === 'recurring') {
            dayDiv.style.display = 'block';
            dateDiv.style.display = 'none';
        } else if(this.value === 'oneoff') {
            dayDiv.style.display = 'none';
            dateDiv.style.display = 'block';
        } else {
            dayDiv.style.display = 'none';
            dateDiv.style.display = 'none';
        }
    });
</script>
@endsection
