@extends('doctor.layouts.master')

@section('content')
<style>
  body {
    background-color: #0D1B2A;
    color: #E0E6ED;
    font-family: 'Poppins', sans-serif;
  }
  .details-container {
    background-color: #fff;
    border-radius: 12px;
    padding: 30px;
    max-width: 800px;
    margin: 30px auto;
    box-shadow: 0 4px 20px rgba(0,0,0,0.4);
  }
  .details-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 25px;
  }
  .details-header h2 {
    background: linear-gradient(90deg, #48CAE4, #7B2FF7);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
  }
  .details-table th {
    width: 200px;
    color: #48CAE4;
    text-transform: uppercase;
    font-size: 13px;
  }
  .details-table td {
    color: black;
    font-size: 14px;
  }
  .urgency-dot {
    width: 16px;
    height: 16px;
    border-radius: 50%;
    display: inline-block;
    margin-right: 6px;
  }
  .red { background: #ff4d4d; }
  .orange { background: #ff9900; }
  .yellow { background: #ffd60a; }
  .green { background: #00b26f; }
  .blue { background: #0096c7; }

  .back-btn {
    background-color: #48CAE4;
    color: #0D1B2A;
    border: none;
    padding: 8px 16px;
    border-radius: 8px;
    font-weight: 500;
    text-decoration: none;
    transition: 0.3s;
  }
  .back-btn:hover { background-color: #3AA2D0; }
</style>

<div class="details-container">
  <div class="details-header">
    <h2>Patient Details</h2>
    <a href="{{ url()->previous() }}" class="back-btn">← Back</a>
  </div>

  @php
    $colors = ['red','orange','yellow','green','blue'];
    $urgency = ['Emergency','High','Moderate','Low','Stable'];
    $color = $colors[($appointment->triage_level - 1) ?? 4] ?? 'blue';
    $urgencyText = $urgency[($appointment->triage_level - 1) ?? 4] ?? 'N/A';
  @endphp
  <table class="table details-table">
    <tr><th>Patient Name:</th><td>{{ $appointment->patient_name }}</td></tr>
    <tr><th>Age / Gender:</th><td>{{ $appointment->age ?? 'N/A' }} / {{ ucfirst($appointment->gender ?? 'N/A') }}</td></tr>
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
</td></tr>
  </table>
</div>
@endsection
