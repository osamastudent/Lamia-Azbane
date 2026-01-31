@extends('Patient.layouts.master')

@section('content')
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
    /* Custom Light Theme Styles */
    body {
        background-color: #f8f9fa; /* Light background for the page */
    }

    .doctor-img {
        width: 60px;
        height: 60px;
        object-fit: cover;
        border-radius: 50%;
        margin-right: 15px;
        border: 2px solid #007bff; /* Primary color border */
    }

    .doctor-info {
        display: flex;
        align-items: center;
        width: 100%;
    }

    .doctor-info > div {
        display: flex;
        flex-direction: column;
        text-align: left;
    }

    .accordion-item {
        background: #ffffff; /* White background for accordion item */
        border: 1px solid #dee2e6; /* Light gray border */
        border-radius: 0.5rem; /* Rounded corners */
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05); /* Subtle shadow */
    }

    .accordion-header .accordion-button {
        color: #343a40; /* Dark text for header */
        background-color: #ffffff; /* White button background */
        border-radius: 0.5rem;
        font-size: 1.1rem;
        font-weight: 600;
        padding: 15px 20px;
    }

    .accordion-header .accordion-button:not(.collapsed) {
        color: #007bff; /* Primary color when active */
        background-color: #e9f5ff; /* Very light blue background when active */
        box-shadow: inset 0 -1px 0 rgba(0, 0, 0, 0.125);
    }

    .accordion-body {
        color: #495057; /* Medium dark text for content */
        background-color: #f8f9fa; /* Light gray background for body */
        border-top: 1px solid #e9ecef;
    }

    /*.page-header h3 {*/
        /*color: #343a40; */
    /*    margin-bottom: 25px;*/
    /*    padding-bottom: 10px;*/
    /*    border-bottom: 1px solid #e9ecef;*/
    /*}*/

    .text-primary-accent {
        color: #007bff !important; /* Standard Bootstrap primary color */
    }
    .doctor-card {
    border: none;
    border-radius: 18px;
    background: #ffffff;
    padding: 20px;
    transition: all 0.25s ease-in-out;
    box-shadow: 0 4px 10px rgba(0,0,0,0.06);
}

.doctor-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 10px 25px rgba(0,0,0,0.12);
}

.doctor-img-lg {
    width: 85px;
    height: 85px;
    border-radius: 50%;
    object-fit: cover;
    border: 3px solid #0d6efd;
}

.doc-name {
    margin: 0;
    font-size: 1.25rem;
    font-weight: 600;
    color: #2c3e50;
}

.doc-special {
    display: inline-block;
    padding: 4px 10px;
    font-size: 0.8rem;
    background: #e7f1ff;
    color: #0d6efd;
    border-radius: 6px;
    margin-top: 4px;
}

.doc-details p {
    margin: 4px 0;
    font-size: 0.95rem;
    color: #5f6f7f;
}

.schedule-item {
    font-size: 0.88rem;
    margin-bottom: 4px;
    padding-left: 10px;
    border-left: 3px solid #0d6efd;
}

.btn-book {
    border-radius: 10px;
    padding: 8px 18px;
    font-size: 0.95rem;
    font-weight: 500;
}

.doctor-accordion .accordion-item {
    border-radius: 14px !important;
    overflow: hidden;
    border: none;
    background: #fff;
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
    margin-bottom: 15px;
}

.doctor-accordion .accordion-button {
    background: #ffffff;
    padding: 18px 20px;
    color: #2c3e50;
    font-weight: 600;
    font-size: 1.1rem;
    border-radius: 14px !important;
}

.doctor-accordion .accordion-button:not(.collapsed) {
    background: #eaf3ff;
    color: #0d6efd;
    box-shadow: none;
}

.doc-img-acc {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid #0d6efd;
    margin-right: 13px;
}

.doc-left-title span {
    font-size: 0.85rem;
    background: #e7f1ff;
    padding: 4px 10px;
    border-radius: 6px;
    color: #0d6efd;
}

.doctor-info-row p {
    margin: 4px 0;
    color: #495057;
}

.schedule-line {
    margin: 5px 0;
    font-size: 0.9rem;
    padding-left: 8px;
    border-left: 3px solid #0d6efd;
}

.btn-book {
    border-radius: 10px;
    font-weight: 500;
    padding: 7px 15px;
}


</style>

<div class="container my-5">

    <div class="page-header">
        <h3>
            <i class="fas fa-stethoscope text-primary-accent me-2"></i> Recommended Specialist:
            <span class="text-primary-accent">{{ $intake->recommended_specialist }}</span>
        </h3>
    </div>

    @if ($doctors->isEmpty())
        <div class="alert alert-info text-center py-4 rounded-3 shadow-sm">
            <i class="fas fa-user-md me-2"></i> No doctors found for this specialization.
        </div>
    @else
      <div class="accordion doctor-accordion" id="doctorAccordion">

@foreach($doctors as $index => $doc)
    <div class="accordion-item">

        <!-- HEADER -->
        <h2 class="accordion-header" id="heading{{ $index }}">
            <button class="accordion-button collapsed" type="button"
                data-bs-toggle="collapse"
                data-bs-target="#collapse{{ $index }}"
                aria-expanded="false"
                aria-controls="collapse{{ $index }}">

                <img src="{{ (!empty($doc->profile_image) && file_exists(public_path('uploads/doctor/profile_images/' . $doc->profile_image))) 
                    ? asset('uploads/doctor/profile_images/' . $doc->profile_image) 
                    : asset('uploads/doctor/default.png') }}"
                    class="doc-img-acc">

                <div class="doc-left-title">
                    <strong>{{ $doc->name }}</strong><br>
                    <span>{{ $doc->specialization }}</span>
                </div>

            </button>
        </h2>

        <!-- BODY -->
        <div id="collapse{{ $index }}" class="accordion-collapse collapse"
             aria-labelledby="heading{{ $index }}"
             data-bs-parent="#doctorAccordion">
            <div class="accordion-body">

                <div class="doctor-info-row mb-3">
                    <p><i class="fa-solid fa-user-tie text-primary me-1"></i> Experience:
                        <strong>{{ $doc->experience_years ?? 'N/A' }} yrs</strong></p>

                    <p><i class="fa-solid fa-hospital text-danger me-1"></i> Hospital:
                        <strong>{{ $doc->hospital_name ?? 'N/A' }}</strong></p>

                    <p><i class="fa-solid fa-building text-info me-1"></i> Department:
                        <strong>{{ $doc->department ?? 'N/A' }}</strong></p>
                </div>

                <h6 class="fw-semibold text-secondary">Available Timings:</h6>

                <!-- ONE-TIME SCHEDULES -->
                @foreach($doc->oneoff_schedules as $schedule)
                    <div class="schedule-line text-success">
                        <i class="fa-regular fa-calendar-check me-1"></i>
                        {{ \Carbon\Carbon::parse($schedule->date)->format('l, d M Y') }}
                        ({{ \Carbon\Carbon::parse($schedule->start_time)->format('h:i A') }} -
                        {{ \Carbon\Carbon::parse($schedule->end_time)->format('h:i A') }})
                    </div>
                @endforeach

                <!-- RECURRING SCHEDULES -->
                @foreach($doc->recurring_schedules as $time => $days)
                    <div class="schedule-line text-primary">
                        <i class="fa-regular fa-clock me-1"></i>
                        {{ implode(', ', $days) }}
                        ({{ \Carbon\Carbon::parse(explode('_', $time)[0])->format('h:i A') }} -
                        {{ \Carbon\Carbon::parse(explode('_', $time)[1])->format('h:i A') }})
                    </div>
                @endforeach

                @if($doc->oneoff_schedules->isEmpty() && empty($doc->recurring_schedules))
                    <p class="text-muted">No available schedules</p>
                @endif

                <div class="text-end mt-3">
                    <a href="{{ url('patient/book-appointment/' . $doc->id) }}"
                       class="btn btn-primary btn-book">
                        <i class="fa-solid fa-calendar-check me-1"></i> Book Appointment
                    </a>
                </div>

            </div>
        </div>
    </div>
@endforeach

</div>



<style>
.hover-card {
    transition: transform 0.2s, box-shadow 0.2s;
}
.hover-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.12);
}
</style>


    @endif

</div>

@endsection