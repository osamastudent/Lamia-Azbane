@extends('Patient.layouts.master')

@section('content')

<style>
body {
    background-color: #f5f7fa !important;
    color: #2c3e50 !important;
    font-family: 'Poppins', sans-serif;
}

/* Card Container */
.details-container {
    background: #ffffff;
    border: 1px solid #e3e6ed;
    border-radius: 16px;
    padding: 30px;
    max-width: 900px;
    margin: 40px auto;
    box-shadow: 0 4px 16px rgba(0,0,0,0.06);
    transition: 0.3s ease;
}

.details-container:hover {
    box-shadow: 0 8px 20px rgba(0,0,0,0.12);
}

/* Header */
.details-header {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 25px;
}

.details-header h2 {
    font-size: 24px;
    font-weight: 700;
    color: #384959;
    letter-spacing: .4px;
    margin: 0;
}

.back-btn {
    background: #384959;
    color: #ffffff;
    padding: 7px 18px;
    border-radius: 6px;
    text-decoration: none;
    font-size: 13px;
    font-weight: 500;
    transition: .2s;
}

.back-btn:hover {
    background: #2f3d50;
    box-shadow: 0 2px 6px rgba(56,73,89,.4);
}

/* Table Styling */
.details-table {
    width: 100%;
    border-collapse: collapse;
}

.details-table th {
    width: 250px;
    font-size: 13px;
    color: #384959;
    text-transform: uppercase;
    font-weight: 600;
    padding: 12px 0;
}

.details-table td {
    font-size: 14px;
    color: #2f3a4c;
    padding: 12px 0;
}

.details-table tr {
    border-bottom: 1px solid #eef1f7;
}

/* Urgency Dot */
.urgency-dot {
    width: 14px;
    height: 14px;
    border-radius: 50%;
    display: inline-block;
    margin-right: 8px;
}

.red { background: #dc3545; }
.orange { background: #fd7e14; }
.yellow { background: #ffc107; }
.green { background: #198754; }
.blue { background: #0d6efd; }

/* Responsive Table Text */
@media(max-width:768px){
    .details-table th,
    .details-table td {
        display: block;
        width: 100%;
        padding: 8px 0;
    }
    .details-table tr {
        margin-bottom: 15px;
        display: block;
        border-bottom: 1px dashed #ccc;
    }
}
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
        $urgencyText = $urgency[($appointment->triage_level - 1) ?? 4] ?? 'Stable';
    @endphp

    <table class="details-table">
        <tr><th>Patient Name:</th><td>{{ $appointment->patient_name }}</td></tr>
        <tr><th>Age / Gender:</th>
            <td>{{ $appointment->age ?? 'N/A' }} / {{ ucfirst($appointment->gender ?? 'N/A') }}</td>
        </tr>
        <tr><th>Triage Level:</th><td>Level {{ $appointment->triage_level ?? 'N/A' }}</td></tr>
        <tr><th>Urgency:</th>
            <td><span class="urgency-dot {{ $color }}"></span> {{ $urgencyText }}</td>
        </tr>
        <tr><th>Symptoms:</th><td>{{ $appointment->symptoms ?? 'N/A' }}</td></tr>
        <tr><th>Common Symptoms:</th>
            <td>{{ !empty($appointment->common_symptoms) ? implode(', ', $appointment->common_symptoms) : 'N/A' }}</td>
        </tr>
        <tr><th>Condition Description:</th><td>{{ $appointment->condition_description ?? 'N/A' }}</td></tr>
        <tr><th>Recommended Specialist:</th><td>{{ $appointment->recommended_specialist ?? 'N/A' }}</td></tr>
        <tr><th>Blood Pressure:</th><td>{{ $appointment->blood_pressure ?? 'N/A' }}</td></tr>
        <tr><th>Temperature:</th><td>{{ $appointment->temperature ?? 'N/A' }}</td></tr>
        <tr><th>Heart Rate:</th><td>{{ $appointment->heart_rate ?? 'N/A' }}</td></tr>
        <tr><th>Pregnancy Status:</th>
            <td>
                @if($appointment->pregnancy_status == 1) Pregnant
                @elseif($appointment->pregnancy_status == 0) Not Pregnant
                @else N/A
                @endif
            </td>
        </tr>
        <tr><th>Breast Feeding:</th>
            <td>
                @if($appointment->breast_feeding == 1) Yes
                @elseif($appointment->breast_feeding == 0) No
                @else N/A
                @endif
            </td>
        </tr>
    </table>

</div>

@endsection
