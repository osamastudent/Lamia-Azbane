@extends('doctor.layouts.master')

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
    padding: 15px 25px;
    border-radius: 12px;
    box-shadow: 0 3px 10px rgba(0,0,0,0.4);
    margin-bottom: 25px;
  }

  .page-header h1 {
    font-weight: 600;
    margin: 0;
    background: linear-gradient(90deg, #48CAE4, #7B2FF7);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
  }

  /* Legend */
   .legend {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    background-color: #fff;
    color:black;
    padding: 10px 15px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.8);
    margin-bottom: 20px;
  }

  .legend-item {
    display: flex;
    align-items: center;
    gap: 6px;
    font-size: 13px;
  }

  .legend-color {
    width: 16px;
    height: 16px;
    border-radius: 3px;
  }

  /* Table container */
  .table-container {
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 3px 15px rgba(0,0,0,0.4);
    padding: 15px;
    overflow-x: auto;
  }

  .theme-table {
    width: 100%;
    border-collapse: separate;
    border-spacing: 0 6px;
  }

 .theme-table thead th {
    color: black;
    font-weight: 600;
    text-transform: uppercase;
    font-size: 13px;
    background-color: #fff;
    padding: 10px 12px;
    border-bottom: 2px solid #48CAE4;
    white-space: nowrap;
  }

  .theme-table tbody tr {
    background-color: #fff;
    border-left: 6px solid transparent;
    transition: all 0.3s ease;
  }

  .theme-table tbody tr:hover {
    background-color: #e3e6f0;
  }

  .theme-table td {
    padding: 10px -1px;
    vertical-align: middle;
    font-size: 13px;
    color: black;
  }


  /* Left border & subtle background glow per urgency level */
  /*.level-1 { border-left-color: #ff4d4d; box-shadow: inset 6px 0 12px rgba(255,77,77,0.2); }*/
  /*.level-2 { border-left-color: #ff9900; box-shadow: inset 6px 0 12px rgba(255,153,0,0.2); }*/
  /*.level-3 { border-left-color: #ffd60a; box-shadow: inset 6px 0 12px rgba(255,214,10,0.2); }*/
  /*.level-4 { border-left-color: #00b26f; box-shadow: inset 6px 0 12px rgba(0,178,111,0.2); }*/
  /*.level-5 { border-left-color: #0096c7; box-shadow: inset 6px 0 12px rgba(0,150,199,0.2); }*/

  /* Big urgency dot + badge */
  .urgency-box {
    display: flex;
    align-items: center;
    gap: 8px;
  }
  .urgency-dot {
    width: 14px;
    height: 14px;
    border-radius: 50%;
  }
  .red { background: #ff4d4d; }
  .orange { background: #ff9900; }
  .yellow { background: #ffd60a; }
  .green { background: #00b26f; }
  .blue { background: #0096c7; }

  .badge {
    padding: 3px 8px;
    border-radius: 6px;
    font-size: 11px;
    font-weight: 600;
    text-transform: uppercase;
    color: #fff;
  }
  .badge.red { background: #a4161a; }
  .badge.orange { background: #e85d04; }
  .badge.yellow { background: #ffd60a; color: #000; }
  .badge.green { background: #00b26f; }
  .badge.blue { background: #0096c7; }

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

  .assign-btn:hover { background-color: #3AA2D0; transform: translateY(-1px); }

  .truncate {
    max-width: 220px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }

  .truncate:hover {
    white-space: normal;
    overflow: visible;
    background-color: #0D1B2A;
    padding: 4px 6px;
    border-radius: 6px;
  }

  .no-data {
    text-align: center;
    color: #aaa;
    padding: 25px 0;
  }
  
    /* Status dropdown styling */
  select[name="status"] {
    background-color: #243249;
    color: #E0E6ED;
    border: 1px solid #3E4C66;
    border-radius: 6px;
    padding: 6px 10px;
    font-size: 13px;
    outline: none;
    transition: all 0.3s ease;
    cursor: pointer;
  }

  select[name="status"]:hover {
    background-color: #2e4160;
    border-color: #48CAE4;
  }

  select[name="status"]:focus {
    box-shadow: 0 0 0 2px rgba(72, 202, 228, 0.3);
    border-color: #48CAE4;
  }

  form label[for="status"] {
    display: block;
    font-size: 12px;
    color: #9FB3C8;
    margin-bottom: 4px;
  }
</style>

<!-- Legend -->
<div class="legend">
  <div class="legend-item"  data-level="1"><div class="legend-color" style="background-color:#ff4d4d;"></div> Level 1 - Emergency</div>
  <div class="legend-item" data-level="2"><div class="legend-color" style="background-color:#ff9900;"></div> Level 2 - High Urgency</div>
  <div class="legend-item" data-level="3"><div class="legend-color" style="background-color:#ffd60a;"></div> Level 3 - Moderate</div>
  <div class="legend-item" data-level="4"><div class="legend-color" style="background-color:#00b26f;"></div> Level 4 - Low</div>
  <div class="legend-item"  data-level="5"><div class="legend-color" style="background-color:#0096c7;"></div> Level 5 - Stable</div>
   <div class="legend-item" data-level="all"><div class="legend-color" style="background-color:#ccc;"></div> Show All</div>
</div>

<div class="card">

<div class="card-header page-header">
  <h1>Online Patients Appointments</h1>
</div>



<div class="card-body table-container">
  <table class="theme-table">
    <thead>
      <tr>
        <th>#</th>
        <th>Level</th>
        <th>Urgency</th>
        <th>Patient</th>
        <th>Date</th>
        <th>Time</th>
        <th>Details</th>
        <th>status</th>
      </tr>
    </thead>
    <tbody>
      @forelse ($appointments as $index => $item)
      
        @php
          $levelClass = "level-" . ($item->triage_level ?? 5);
          $colors = ['red','orange','yellow','green','blue'];
          $color = $colors[($item->triage_level - 1) ?? 4] ?? 'blue';
          $commonSymptoms = json_decode($item->common_symptoms, true);
          $commonSymptomsText = is_array($commonSymptoms) ? implode(', ', $commonSymptoms) : 'N/A';
        @endphp
        <tr class="{{ $levelClass }}">
          <td>{{ $appointments->firstItem() + $index }}</td>
          <td><strong>Level {{ $item->triage_level ?? 'N/A' }}</strong></td>
          <td>
            <div class="urgency-box">
              <div class="urgency-dot {{ $color }}"></div>
              <span class="badge {{ $color }}">
                {{ ['Emergency','High','Moderate','Low','Stable'][$item->triage_level - 1] ?? 'N/A' }}
              </span>
            </div>
          </td>
          <td>{{ $item->patient_name }}</td>
          <td>{{ $item->appointment_date ?? 'N/A' }}</td>
          <td>{{ $item->appointment_time ?? 'N/A' }}</td>
          
          <td>
              <a href="{{ route('doctor.appointments.view', $item->appointment_id) }}" class="assign-btn">
                <i class="fas fa-eye"></i> View
              </a>
              
            </td>
          <td>
            @if($item->meeting_link)
                <a href="{{ route('doctor.appointments.consult', $item->appointment_id) }}" class="btn btn-sm btn-success">
                    <i class="fas fa-video"></i> Join
                </a>
            @else
                <span class="text-danger">No link</span>
            @endif
        </td>

        </tr>
      @empty
        <tr><td colspan="14" class="no-data">No patient intake records found.</td></tr>
      @endforelse
    </tbody>
  </table>
  <div class="mt-3">{{ $appointments->links() }}</div>
</div>
</div>
<script>
function copyLink(link) {
    navigator.clipboard.writeText(link);
    alert("Meeting link copied!");
}
</script>
<script>
  const legendItems = document.querySelectorAll('.legend-item');
  const tableRows = document.querySelectorAll('.theme-table tbody tr');

  legendItems.forEach(item => {
    item.addEventListener('click', () => {
      const level = item.getAttribute('data-level');

      tableRows.forEach(row => {
        if (level === 'all') {
          row.style.display = ''; // show all rows
        } else {
          row.style.display = row.classList.contains('level-' + level) ? '' : 'none';
        }
      });
    });
  });
</script>
@endsection
