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

  .theme-table th {
    color: #48CAE4;
    font-weight: 600;
    text-transform: uppercase;
    padding: 10px 12px;
    border-bottom: 2px solid #48CAE4;
    white-space: nowrap;
    background-color: #0D1B2A;
  }

  .theme-table td {
    padding: 10px 12px;
    border-bottom: 1px solid rgba(255, 255, 255, 0.05);
    vertical-align: middle;
  }

  /* Smooth hover effect */
  .theme-table tbody tr {
    transition: background-color 0.3s ease, filter 0.2s ease;
  }
  .theme-table tbody tr:hover {
    filter: brightness(1.15);
  }

  /* Description truncation with hover expand */
  .truncate {
    max-width: 200px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    display: inline-block;
    vertical-align: middle;
  }

  .truncate:hover {
    white-space: normal;
    overflow: visible;
    background-color: #0D1B2A;
    padding: 4px 8px;
    border-radius: 6px;
    box-shadow: 0 2px 8px rgba(72,202,228,0.3);
  }

  /* Custom dropdown (theme matched) */
  .form-select {
    background-color: #0D1B2A;
    color: #E0E6ED;
    border: 1px solid #48CAE4;
    padding: 8px 12px;
    border-radius: 8px;
    width: 100%;
    outline: none;
    transition: 0.3s ease;
    appearance: none;
    font-size: 14px;
    background-image: linear-gradient(45deg, transparent 50%, #48CAE4 50%), 
                      linear-gradient(135deg, #48CAE4 50%, transparent 50%);
    background-position: calc(100% - 20px) calc(1em + 2px), calc(100% - 15px) calc(1em + 2px);
    background-size: 5px 5px, 5px 5px;
    background-repeat: no-repeat;
  }

  .form-select:hover,
  .form-select:focus {
    border-color: #7B2FF7;
    box-shadow: 0 0 10px rgba(123, 47, 247, 0.5);
  }

  /* Assign button */
  .assign-btn {
    background-color: #48CAE4;
    color: #0D1B2A;
    border: none;
    padding: 6px 14px;
    border-radius: 6px;
    font-weight: 500;
    cursor: pointer;
    transition: 0.3s;
  }

  .assign-btn:hover {
    background-color: #3AA2D0;
    transform: translateY(-1px);
  }

  .no-data {
    text-align: center;
    color: #999;
    padding: 25px 0;
  }
   /* Legend styles */
  .legend {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
    align-items: center;
    background-color: #1B263B;
    padding: 10px 15px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.3);
    margin-bottom: 25px;
  }

  .legend-item {
    display: flex;
    align-items: center;
    gap: 6px;
    font-size: 13px;
  }

  .legend-color {
    width: 18px;
    height: 18px;
    border-radius: 4px;
    border: 1px solid rgba(255,255,255,0.2);
  }
</style>

<div class="page-header">
  <h1>Assign Doctors to Patients</h1>
</div>

<!-- Legend -->
<div class="legend">
  <div class="legend-item"><div class="legend-color" style="background-color:#5b1111;"></div> Level 1 - 🔴 Critical / Emergency</div>
  <div class="legend-item"><div class="legend-color" style="background-color:#7a3c00;"></div> Level 2 - 🟠 High Urgency</div>
  <div class="legend-item"><div class="legend-color" style="background-color:#7a6a00;"></div> Level 3 - 🟡 Moderate</div>
  <div class="legend-item"><div class="legend-color" style="background-color:#1f4d1f;"></div> Level 4 - 🟢 Low</div>
  <div class="legend-item"><div class="legend-color" style="background-color:#113d5b;"></div> Level 5 - 🔵 Stable</div>
</div>

<div class="table-container">
  <table class="table theme-table">
    <thead>
      <tr>
        <th>#</th>
        <th>Condition Level</th>
        <th>Description</th>
        <th>Patient Name</th>
        <th>Age / Gender</th>
        <th>Recommended Specialist</th>
        <th>Assign Doctor</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
      @forelse ($intake as $index => $item)
        @php
          $rowColors = [
              1 => '#5b1111', // Emergency - Red
              2 => '#7a3c00', // Critical - Orange
              3 => '#7a6a00', // Urgent - Yellow
              4 => '#1f4d1f', // Moderate - Green
              5 => '#113d5b', // Low - Blue
          ];
          $levelColor = $rowColors[$item->triage_level] ?? '#1B263B';
        @endphp
        <tr style="background-color: {{ $levelColor }};">
          <td>{{ $intake->firstItem() + $index }}</td>
          <td><strong>Level {{ $item->triage_level }}</strong></td>
          <td>
            <span class="truncate" title="{{ $item->triage_description }}">
              {{ $item->triage_description }}
            </span>
          </td>
          <td>{{ $item->patient_name }}</td>
          <td>{{ $item->age ?? 'N/A' }} / {{ ucfirst($item->gender ?? 'N/A') }}</td>
          <td>{{ $item->recommended_specialist ?? 'N/A' }}</td>
          <td>
            <form action="" method="POST">
              @csrf
              <input type="hidden" name="intake_id" value="{{ $item->intake_id }}">
              <select name="doctor_id" class="form-select">
                <option value="">-- Select Doctor --</option>
                @forelse ($approvedDoctors[strtolower(trim($item->recommended_specialist))] ?? [] as $doctor)
                  <option value="{{ $doctor->id }}">
                    {{ $doctor->doctor_name }} ({{ $doctor->specialization }})
                  </option>
                @empty
                  <option disabled>No approved doctor found</option>
                @endforelse
              </select>
          </td>
          <td>
              <button type="submit" class="assign-btn">Assign</button>
            </form>
          </td>
        </tr>
      @empty
        <tr>
          <td colspan="8" class="no-data">No patient intake records found.</td>
        </tr>
      @endforelse
    </tbody>
  </table>
  {{ $intake->links() }}

</div>
@endsection
