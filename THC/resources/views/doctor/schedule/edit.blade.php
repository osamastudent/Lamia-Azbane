@extends('doctor.layouts.master')

@section('content')
<style>
body {
    background-color: #0D1B2A;
    color: #E0E6ED;
    font-family: 'Poppins', sans-serif;
}

.container {
    max-width: 800px;
    margin-top: 50px;
}

.page-header {
    background-color: #1B263B;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.4);
    text-align: center;
    margin-bottom: 30px;
}

.page-header h3 {
    font-weight: 600;
    margin: 0;
    background: linear-gradient(90deg, #48CAE4, #7B2FF7);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

/* Form card */
.form-card {
    background-color: #1B263B;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.4);
}

/* Labels */
.form-label {
    font-weight: 500;
    margin-bottom: 6px;
    color: #E0E6ED;
}

/* Inputs & selects */
.form-select, .form-control {
    background-color: #0D1B2A;
    color: #E0E6ED;
    border: 1px solid #48CAE4;
    border-radius: 8px;
    padding: 10px 12px;
    transition: 0.3s ease;
}

.form-select option {
    background-color: #0D1B2A;
    color: #E0E6ED;
}

/* Focus effect */
.form-select:focus, .form-control:focus {
    border-color: #7B2FF7;
    box-shadow: 0 0 10px rgba(123,47,247,0.6);
    outline: none;
}

/* Button */
.btn-primary {
    background: linear-gradient(90deg, #48CAE4, #7B2FF7);
    border: none;
    color: #0D1B2A;
    padding: 10px 25px;
    border-radius: 30px;
    font-weight: 500;
    transition: 0.3s ease;
}

.btn-primary:hover {
    background: linear-gradient(90deg, #7B2FF7, #48CAE4);
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(123,47,247,0.4);
}

/* Alerts */
.alert {
    background-color: #1B263B;
    color: #ffae00;
    border: 1px solid rgba(255,255,255,0.1);
    box-shadow: 0 2px 8px rgba(0,0,0,0.3);
    padding: 12px 18px;
    border-radius: 8px;
}

/* Responsive adjustments */
@media(max-width: 576px){
    .form-card {
        padding: 20px;
    }
}
</style>

<div class="container">
    <div class="page-header">
        <h3>Edit Doctor Schedule</h3>
    </div>

    <div class="form-card">
        @if(session('success'))
            <div class="alert">{{ session('success') }}</div>
        @endif

        <form action="{{ route('doctor.schedule.update', $schedule->id) }}" method="POST">
            @csrf
            @method('PUT')

            <div class="mb-3">
                <label for="type" class="form-label">Schedule Type</label>
                <select name="type" id="type" class="form-select" required>
                    <option value="">-- Select Type --</option>
                    <option value="recurring" {{ $schedule->type == 'recurring' ? 'selected' : '' }}>Recurring</option>
                    <option value="oneoff" {{ $schedule->type == 'oneoff' ? 'selected' : '' }}>One-off</option>
                </select>
            </div>

            <div class="mb-3" id="day_of_week_div" style="display:none;">
                <label for="day_of_week" class="form-label">Day of Week</label>
                <select name="day_of_week" id="day_of_week" class="form-select">
                    @foreach($daysOfWeek as $day)
                        <option value="{{ $day }}" {{ $schedule->day_of_week == $day ? 'selected' : '' }}>{{ $day }}</option>
                    @endforeach
                </select>
            </div>

            <div class="mb-3" id="date_div" style="display:none;">
                <label for="date" class="form-label">Date</label>
                <input type="date" name="date" id="date" class="form-control" value="{{ $schedule->date }}">
            </div>

            <div class="mb-3">
                <label for="start_time" class="form-label">Start Time</label>
                <input type="time" name="start_time" id="start_time" class="form-control" value="{{ $schedule->start_time }}" required>
            </div>

            <div class="mb-3">
                <label for="end_time" class="form-label">End Time</label>
                <input type="time" name="end_time" id="end_time" class="form-control" value="{{ $schedule->end_time }}" required>
            </div>

            <button type="submit" class="btn btn-primary w-100">Update Schedule</button>
        </form>
    </div>
</div>

<script>
const typeSelect = document.getElementById('type');
const dayDiv = document.getElementById('day_of_week_div');
const dateDiv = document.getElementById('date_div');

function toggleTypeFields() {
    if(typeSelect.value === 'recurring') {
        dayDiv.style.display = 'block';
        dateDiv.style.display = 'none';
    } else if(typeSelect.value === 'oneoff') {
        dayDiv.style.display = 'none';
        dateDiv.style.display = 'block';
    } else {
        dayDiv.style.display = 'none';
        dateDiv.style.display = 'none';
    }
}

typeSelect.addEventListener('change', toggleTypeFields);
window.addEventListener('load', toggleTypeFields);
</script>
@endsection
