@extends('Patient.layouts.master')

@section('content')

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.css" rel="stylesheet">

<style>
    body {
        background-color: #0D1B2A;
        color: #E0E6ED;
        font-family: 'Poppins', sans-serif;
    }

    .booking-card {
        background: #fff;
        border-radius: 16px;
        padding: 40px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.4);
        max-width: 950px;
        margin: 50px auto;
        border: 1px solid rgba(72, 202, 228, 0.1);
    }

    .booking-card h4 {
        color: #1a237e;
        font-weight: 600;
        border-bottom: 2px solid #101827;
        padding-bottom: 15px;
        margin-bottom: 30px;
        text-align: center;
    }

    .doctor-info {
        background-color: #fff;
        border-radius: 12px;
        padding: 20px 25px;
        margin-bottom: 25px;
        display: flex;
        align-items: center;
        gap: 125px;
        flex-wrap: wrap;
    }
    .doctor-info img {
        border-radius: 8px;
        width: 100px;
        height: 120px;
        object-fit: cover;
    }

    .doctor-info h5 {
        color: #FFC300;
        margin-bottom: 5px;
    }

    .calendar-box, .slot-box {
        background-color: #fff;
        border-radius: 12px;
        padding: 20px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.15);

    }

    .calendar-box h6, .slot-box h6 {
        color: #1a237e;
        margin-bottom: 15px;
        font-weight: 600;
    }

    /*.time-btn {*/
    /*    border-radius: 10px;*/
    /*    padding: 10px 18px;*/
    /*    background: #101827;*/
    /*    border: 1px solid #3A4750;*/
    /*    color: #E0E6ED;*/
    /*    transition: all 0.3s ease;*/
    /*}*/
    
    .time-btn {
    border-radius: 10px;
    padding: 10px 18px;
    background: #fff;
    border: 1px solid #1a237e;
    color: black;
    box-shadow: 0 8px 20px rgba(0,0,0,0.15);
    transition: all 0.3s ease;
}

    .time-btn:hover {
        background-color: #48CAE4;
        color: #fff;
    }

    .time-btn.active {
        background: linear-gradient(90deg, #48CAE4, #7B2FF7);
        color: white;
        border: none;
        box-shadow: 0 0 10px rgba(123, 47, 247, 0.4);
    }

    .btn-primary {
        background: linear-gradient(90deg, #48CAE4, #7B2FF7);
        border: none;
        color: #fff;
        padding: 10px 35px;
        font-weight: 500;
        border-radius: 30px;
        transition: all 0.3s ease;
    }

    .btn-primary:hover {
        background: linear-gradient(90deg, #7B2FF7, #48CAE4);
        transform: translateY(-2px);
        box-shadow: 0 6px 15px rgba(123, 47, 247, 0.4);
    }

    #calendar {
        border-radius: 12px;
        padding: 10px;
        background-color: #fff;
        border: 1px solid white;
        box-shadow: 0 8px 20px rgba(0,0,0,0.15);
    }

    .fc-toolbar-title {
        color: #1a237e !important;
        font-size: 1.2rem;
        font-weight: 600;
    }

    .fc-button-primary {
        background: #48CAE4 !important;
        border: none !important;
        color: #0D1B2A !important;
    }

    /*.fc-daygrid-day-number {*/
    /*    color: #E0E6ED !important;*/
    /*}*/

    .fc-daygrid-day.fc-day-today {
        background: rgba(72, 202, 228, 0.2) !important;
    }

   .selected-date {
    border: 2px solid #48CAE4 !important;
    border-radius: 8px;
    background-color: #E0F7FB !important; /* Light blue highlight */
    color: #000; /* Text clear visible */
}


    @media (max-width: 768px) {
        .doctor-info {
            flex-direction: column;
            align-items: flex-start;
        }
        .doctor-info img {
            width: 90px;
            height: 110px;
        }
        .doctor-info .text-end {
            text-align: left !important;
        }
    }

    .calendar-box {
        border-radius: 10px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        padding: 15px;
    }

    /* ✅ Align the toolbar (Today, Prev, Next) properly */
    .fc-toolbar {
        display: flex !important;
        justify-content: space-between !important;
        align-items: center !important;
        flex-wrap: wrap;
    }

    .fc-toolbar-chunk {
        display: flex;
        align-items: center;
        gap: 5px;
    }

    /* Make buttons look consistent */
    .fc-button {
        background-color: #0d6efd !important;
        border: none !important;
        color: white !important;
        border-radius: 5px !important;
        padding: 4px 8px !important;
        font-size: 12px !important;
    }
    .consult-btn {
    border-radius: 10px;
    padding: 10px 25px;
    background: #fff;
    border: 1px solid #1a237e;
    color: black;
    transition: all 0.3s ease;
    box-shadow: 0 5px 25px rgba(0,0,0,0.08);

}

.consult-btn:hover {
    background-color: #48CAE4;
    color: #fff;
}

.consult-btn.active {
    background: linear-gradient(90deg, #48CAE4, #7B2FF7);
    color: white;
    border: none;
    box-shadow: 0 0 10px rgba(123, 47, 247, 0.4);
}
.fc-past-date {
    color: #888 !important;       /* muted text */
    background-color: #101827;    /* same as calendar bg */
    pointer-events: none;          /* disables hover/click */
    opacity: 0.6;                 /* dim slightly */
}

.text-dark1{
    color:#1c1b1b !important;
}

.text-dark2{
    color:#1c1b1b !important;
    font-size: 23px;
}


</style>

@if ($errors->any())
    <div class="alert alert-danger mb-3">
        <ul class="mb-0">
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

<div class="container">
    <div class="booking-card">
        <h4><i class="fas fa-calendar-alt me-2"></i> Book Your Appointment</h4>

        <!-- Doctor Information -->
        <div class="doctor-info">
            <!-- Left: Image & Basic Info -->
            <div class="d-flex align-items-center gap-3">
                <img 
                    src="{{ $doctor->profile_image ? asset('uploads/doctor/profile_images/' . $doctor->profile_image) : asset('default-doctor.png') }}" 
                    alt="Doctor Photo">
                <div style="margin-left:20px;">
                    <h5 class="mb-1"><span class="font-weight-bold">{{ $doctor->name }}</span></h5>
                    <p class="text-dark1 mb-0"><span class="font-weight-bold">{{ $doctor->specialization }}</span></p>
                    <p class="text-dark1 mb-0"><span class="font-weight-bold"><i class="fas fa-user-graduate me-2"></i> {{ $doctor->qualification }}</span></p>
                </div>
            </div>

            <!-- Right: Experience & Other Info -->
            <div class="text-end">
                <p class="text-dark1 mb-1">
                    <span class="font-weight-bold">
                        Experience:
                    </span> {{ $doctor->experience_years }} years
                </p>

                <p class="text-dark1 mb-1"><span class="font-weight-bold">Hospital:</span> {{ $doctor->hospital_name }}</p>
               @if ($doctor->online_available == 1)
                    <p class="mb-1 text-dark1 font-weight-bold">
                        <i class="fas fa-video me-2 text-success"></i> Online Consultation Available
                    </p>
                @else
                    <p class="text-muted mb-1 text-dark1 font-weight-bold">
                        <i class="fas fa-clinic-medical me-2 text-danger"></i> Clinic Consultation Only
                    </p>
                @endif
            </div>
        </div>

        <!-- Appointment Form -->
        <form action="{{ route('patient.appointment.store', ['doctor_id' => $doctor->id]) }}" method="POST">
            @csrf
            <input type="hidden" name="patient_intake_id" value="{{ $intake->id ?? '' }}">
            <input type="hidden" name="doctor_id" value="{{ $doctor->id }}">
            <input type="hidden" name="appointment_date" id="appointment_date" required>
            <input type="hidden" name="appointment_time" id="appointment_time" required>
            <input type="hidden" name="consultation_type" id="consultation_type" required>  {{-- Added hidden field --}}
            
             {{-- ✅ Consultation Type Selection --}}
        <div class="mb-4 text-center">
            <h6 class="text-dark2 mb-3 fs-1"><i class="fas fa-hand-point-down me-2"></i>Select Consultation Type</h6>
            <div class="gap-3 flex-wrap">
                @if($doctor->online_available == 1)
                    <button type="button" class="btn consult-btn" data-type="online">
                        <i class="fas fa-video me-2"></i> Online Consultation
                    </button>
                @endif
    
                <button type="button" class="btn consult-btn" data-type="clinic">
                    <i class="fas fa-clinic-medical me-2"></i> Clinic Visit
                </button>
            </div>
        </div>

            <div class="row g-4">
                <!-- Left: Calendar -->
                <div class="col-md-6">
                    <div class="calendar-box">
                        <h6><i class="fas fa-calendar-day me-2"></i>Select Date</h6>
                        <div id="calendar"></div>
                        <div id="selected-date-text" class="mt-2 text-info small text-center"></div>
                    </div>
                </div>
                <!-- Right: Time Slots -->
                <div class="col-md-6">
                    <div class="slot-box">
                        <h6><i class="fas fa-clock me-2"></i>Select Time Slot</h6>
                        <div id="time-slots" class="d-flex flex-wrap gap-2">
                             @if(!empty($timeslots))
                                @foreach($timeslots as $slot)
                                    <button type="button" class="btn time-btn" onclick="selectTime('{{ $slot }}')">
                                        {{ $slot }}
                                    </button>

                                @endforeach
                             @else
                                <p class="text-muted">No available slots today.</p>
                             @endif
                            </div>

                    </div>
                </div>
                
                
                

            </div>

            <div class="text-center mt-4">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-check-circle me-2"></i>Confirm Appointment
                </button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function () {
    const calendarEl = document.getElementById('calendar');
    const selectedDateText = document.getElementById('selected-date-text');
    const timeSlotDiv = document.getElementById('time-slots');
    const today = new Date().toISOString().split('T')[0];

    // Initialize FullCalendar
    const calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        selectable: true,
        height: 400,
        
        // Disable past dates from click
    dateClick: function(info) {
        const dateStr = info.dateStr;
        if (dateStr < today) {
            return; // Do nothing for past dates
        }
        selectDate(info.dateStr, info.dayEl);
    },

    dayCellDidMount: function(info) {
        const dateStr = info.date.toISOString().split('T')[0];
        if (dateStr < today) {
            info.el.classList.add('fc-past-date'); // Add a class to style past dates
        }
    },
        dayMaxEvents: true,
        themeSystem: 'standard',
    });

    // Render calendar (this is what makes it visible!)
    calendar.render();

    // Load today by default
    selectDate(today);

    // Handle date selection
    function selectDate(dateStr, dayEl = null) {
        // Highlight the selected day
        document.querySelectorAll('.fc-daygrid-day').forEach(day => day.classList.remove('selected-date'));
        if (dayEl) dayEl.classList.add('selected-date');

        // Update form + text
        document.getElementById('appointment_date').value = dateStr;
        selectedDateText.innerHTML = `<i class="fas fa-check-circle text-success me-1"></i> Selected: <strong>${dateStr}</strong>`;

        // Fetch available time slots
       // Fetch available time slots
fetch(`/patient/doctor/{{ $doctor->id }}/slots?date=${dateStr}`)
    .then(res => res.json())
    .then(data => {
        timeSlotDiv.innerHTML = '';
        if (data.length === 0) {
            timeSlotDiv.innerHTML = '<p class="text-muted">No available slots for this date.</p>';
        } else {
            data.forEach(slot => {
                const btn = document.createElement('button');
                btn.className = 'btn time-btn';
                btn.type = 'button';
                btn.textContent = slot.time;

            if (slot.status === 'booked') {
                btn.disabled = true;
                btn.classList.add('disabled');
                btn.style.opacity = 0.5;
                btn.title = 'Already booked';
            } else {
                btn.onclick = () => selectTime(slot.time);
            }

                timeSlotDiv.appendChild(btn);
            });
        }
    })
    .catch(err => {
        console.error(err);
        timeSlotDiv.innerHTML = '<p class="text-danger">Error loading slots.</p>';
    });

    }
});

// Handle time selection
function selectTime(time) {
    document.querySelectorAll('.time-btn').forEach(btn => btn.classList.remove('active'));
    const selected = Array.from(document.querySelectorAll('.time-btn')).find(btn => btn.textContent.trim() === time);
    if (selected) selected.classList.add('active');
    document.getElementById('appointment_time').value = time;
}

// Handle consultation type selection
document.querySelectorAll('.consult-btn').forEach(btn => {
    btn.addEventListener('click', function() {
        document.querySelectorAll('.consult-btn').forEach(b => b.classList.remove('active'));
        this.classList.add('active');
        document.getElementById('consultation_type').value = this.dataset.type;
    });
});

</script>




@endsection
