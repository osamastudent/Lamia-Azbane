@extends('doctor.layouts.master')

@section('content')
<style>
  body {
    background-color: #0D1B2A;
    color: #E0E6ED;
    font-family: 'Poppins', sans-serif;
  }

  .card {
    /*background-color: #1B263B !important;*/
    color: #E0E6ED;
    border: none;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.3);
  }

  .card-header {
    background-color: #0D1B2A;
    color: #48CAE4;
    font-weight: 600;
    border-bottom: 1px solid #3A506B;
  }

  .table th {
    color: #48CAE4;
    width: 40%;
  }

  .table td {
    color: black;
  }

  textarea.form-control {
    /*background-color: #0D1B2A;*/
    color: #E0E6ED;
    border: 1px solid #3A506B;
    border-radius: 8px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.1);
  }

  textarea.form-control:focus {
    border-color: #48CAE4;
    box-shadow: 0 0 6px rgba(72,202,228,0.4);
  }

  .btn-custom {
    background: linear-gradient(90deg, #48CAE4, #7B2FF7);
    border: none;
    color: white;
    font-weight: 500;
    width: 100%;
    padding: 10px;
    border-radius: 8px;
    transition: 0.3s;
  }

  .btn-custom:hover {
    opacity: 0.9;
  }

  .urgency-dot {
    display: inline-block;
    width: 12px;
    height: 12px;
    border-radius: 50%;
    margin-right: 8px;
  }

  .red { background: #e63946; }
  .orange { background: #f4a261; }
  .yellow { background: #e9c46a; }
  .green { background: #2a9d8f; }
  .blue { background: #0077b6; }
</style>

<div class="container-fluid mt-4">
  <!-- Video Section -->
  <div class="card mb-4">
    <div class="card-header">Live Video Consultation</div>
    <div class="card-body p-0">
      @if($appointment->meeting_link)
        <iframe src="{{ $appointment->meeting_link }}"
                width="100%" height="500"
                allow="camera; microphone; fullscreen"
                style="border:none;">
        </iframe>
      @else
        <div class="d-flex justify-content-center align-items-center p-5 text-danger">
          <h4>No meeting link available.</h4>
        </div>
      @endif
    </div>
  </div>

  <!-- Patient Info + Notes -->
  <div class="row g-4">
    <!-- Patient Information -->
    <div class="col-md-6">
      @php
        $colors = ['red','orange','yellow','green','blue'];
        $urgency = ['Emergency','High','Moderate','Low','Stable'];
        $color = $colors[($appointment->triage_level - 1) ?? 4] ?? 'blue';
        $urgencyText = $urgency[($appointment->triage_level - 1) ?? 4] ?? 'N/A';
      @endphp

      <div class="card">
        <div class="card-header">Patient Information</div>
        <div class="card-body">
          <table class="table table-borderless mb-0">
            <tr><th>Patient Name:</th><td>{{ $appointment->patient_name }}</td></tr>
            <tr><th>Age / Gender:</th><td>{{ $appointment->patient_age ?? 'N/A' }} / {{ ucfirst($appointment->patient_gender ?? 'N/A') }}</td></tr>
            <tr><th>Triage Level:</th><td>Level {{ $appointment->triage_level ?? 'N/A' }}</td></tr>
            <tr><th>Urgency:</th>
                <td><span class="urgency-dot {{ $color }}"></span>{{ $urgencyText }}</td></tr>
            <tr><th>Symptoms:</th><td>{{ $appointment->symptoms ?? 'N/A' }}</td></tr>
           <tr><th>Common Symptoms:</th>
        <td>
          @if (!empty($appointment->common_symptoms))
            {{ implode(', ', $appointment->common_symptoms) }}
          @else
            N/A
          @endif
        </td>
    </tr>
            <tr><th>Condition Description:</th><td>{{ $appointment->condition_description ?? 'N/A' }}</td></tr>
            <tr><th>Recommended Specialist:</th><td>{{ $appointment->recommended_specialist ?? 'N/A' }}</td></tr>
            <tr><th>Triage Description:</th><td>{{ $appointment->triage_description ?? 'N/A' }}</td></tr>
            <tr><th>Blood Pressure:</th><td>{{ $appointment->blood_pressure ?? 'N/A' }}</td></tr>
            <tr><th>Temperature:</th><td>{{ $appointment->temperature ?? 'N/A' }}</td></tr>
            <tr><th>Heart Rate:</th><td>{{ $appointment->heart_rate ?? 'N/A' }}</td></tr>
            <tr><th>Pregnancy Status:</th><td>
                @if($appointment->pregnancy_status == 1)
                Pregnant
                @elseif($appointment->pregnancy_status == 0)
                Not Pregnant
                @else
                N/A
                @endif</td></tr>
            <tr><th>Breast Feeding:</th>
                <td>
                  @if($appointment->breast_feeding == 1)
                      Yes
                  @elseif($appointment->breast_feeding == 0)
                      No
                  @else
                      N/A
                  @endif
                </td>
            </tr>
          </table>
        </div>
      </div>
    </div>
    

    
    
    <!-- Consultation Notes -->
    <div class="col-md-6">
      <div class="card">
        <div class="card-header">Consultation Notes</div>
        <div class="card-body">
          <form action="{{ route('doctor.appointments.storeNotes', $appointment->id) }}" method="POST">
            @csrf
            <input type="hidden" name="doctor_id" value="{{$appointment->doctor_id}}" />
            <input type="hidden" name="patient_id" value="{{$appointment->patient_id}}" />
            <input type="hidden" name="patient_intake_id" value="{{$appointment->patient_intake_id}}" />
            <div class="mb-3">
              <label for="diagnosis" class="form-label text-dark">Diagnosis</label>
              <textarea name="diagnosis" class="form-control" rows="3">{{ $note->diagnosis ?? '' }}</textarea>
            </div>
            <div class="mb-3">
              <label for="treatment_plan" class="form-label text-dark">Treatment Plan</label>
              <textarea name="treatment_plan" class="form-control" rows="3">{{ $note->treatment_plan ?? '' }}</textarea>
            </div>
            <div class="mb-3">
              <label for="follow_up" class="form-label text-dark">Follow-up</label>
              <textarea name="follow_up" class="form-control" rows="2">{{ $note->follow_up ?? '' }}</textarea>
            </div>
            <button type="submit" class="btn-custom">Save & Send to Patient</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>





<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
$(document).ready(function () {
    let timeout;

    // jab doctor likhna band kare 2 sec tak
    $('textarea[name="diagnosis"], textarea[name="treatment_plan"], textarea[name="follow_up"]').on('input', function () {
        clearTimeout(timeout);
        timeout = setTimeout(autoSaveNotes, 2000);
    });

    function autoSaveNotes() {
        let form = $('form');
        let url = "{{ route('doctor.appointments.autoSave', $appointment->id) }}";
        let data = form.serialize();

        $.ajax({
            url: url,
            type: "POST",
            data: data,
            success: function (response) {
                showToast("Notes auto-saved ✓");
            },
            error: function () {
                showToast("Auto-save failed, please try again.", true);
            }
        });
    }

    // small toast
    function showToast(message, isError = false) {
        let toast = $('<div class="autosave-toast"></div>').text(message);
        toast.css({
            position: 'fixed',
            bottom: '20px',
            right: '20px',
            background: isError ? '#e63946' : '#2a9d8f',
            color: '#fff',
            padding: '10px 20px',
            borderRadius: '8px',
            boxShadow: '0 0 10px rgba(0,0,0,0.4)',
            zIndex: 9999,
            fontWeight: '500',
            opacity: 0
        }).appendTo('body').animate({opacity: 1}, 300);

        setTimeout(() => {
            toast.fadeOut(500, function () { $(this).remove(); });
        }, 2500);
    }
});
</script>



@endsection
