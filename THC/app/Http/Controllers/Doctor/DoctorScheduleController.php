<?php

namespace App\Http\Controllers\Doctor;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\DoctorSchedule;

class DoctorScheduleController extends Controller
{

    public function index()
    {
        $userId = Auth::id();
        $doctorRecord = DB::table('doctors')
            ->where('user_id', $userId)
            ->select('id')
            ->first();
        if (!$doctorRecord) {
            return view('doctor.schedule.index', ['schedules' => collect([])]);
        }
       
        $doctorId = $doctorRecord->id;
        $schedules = DoctorSchedule::where('doctor_id', $doctorId)
            ->orderBy('day_of_week')
            ->get();
        return view('doctor.schedule.index', compact('schedules'));
    }
    
    public function create(){
        
      $daysOfWeek  = ['Monday' , 'Tuesday' , 'Wednesday' , 'Thursday' , 'Friday' , 'Saturday' , 'Sunday'];
      
        return view('doctor.schedule.create' , compact('daysOfWeek'));

    }
    
     public function store(Request $request)
    {
        
        $request->validate([
            'type' => 'required|in:recurring,oneoff',
            'day_of_week' => 'required_if:type,recurring|nullable|in:Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',
            'date' => 'required_if:type,oneoff|nullable|date',
            'start_time' => 'required|date_format:H:i',
            'end_time' => 'required|date_format:H:i|after:start_time',
        ]);
        $userId = Auth::id();

    $doctorRecord = DB::table('doctors')
        ->where('user_id', $userId) 
        ->select('id') 
        ->first();

    if (!$doctorRecord) {
        return redirect()->back()->with('error', 'Doctor record not found. Schedule cannot be created.');
    }
    
    
    $doctorId = $doctorRecord->id;

    $data = DoctorSchedule::create([
            'doctor_id' => $doctorId,
            'type' =>$request->type,
            'day_of_week' => $request->type === 'recurring' ? $request->day_of_week : null,
            'date' => $request->type === 'oneoff' ? $request->date : null,
            'start_time' => $request->start_time,
            'end_time' => $request->end_time,
            'is_available' => 1
        ]);
        
        return redirect()->back()->with('success', 'Schedule created successfully!');
    }
    
    
    public function edit($id)
{
    $userId = Auth::id();
    $doctorRecord = DB::table('doctors')->where('user_id', $userId)->select('id')->first();
    if (!$doctorRecord) {
        return redirect()->back()->with('error', 'Doctor not found.');
    }

    $schedule = DoctorSchedule::where('doctor_id', $doctorRecord->id)->where('id', $id)->firstOrFail();
    $daysOfWeek = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];

    return view('doctor.schedule.edit', compact('schedule','daysOfWeek'));
}

public function update(Request $request, $id)
{
    
   $vali = $request->validate([
        'type' => 'required|in:recurring,oneoff',
        'day_of_week' => 'required_if:type,recurring|nullable|in:Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday',
        'date' => 'required_if:type,oneoff|nullable|date',
        'start_time' => 'required',
        'end_time' => 'required',
    ]);

    $userId = Auth::id();
    $doctorRecord = DB::table('doctors')->where('user_id', $userId)->select('id')->first();
    if (!$doctorRecord) {
        return redirect()->back()->with('error', 'Doctor not found.');
    }

    $schedule = DoctorSchedule::where('doctor_id', $doctorRecord->id)->where('id', $id)->firstOrFail();

    $schedule->update([
        'type' => $request->type,
        'day_of_week' => $request->type === 'recurring' ? $request->day_of_week : null,
        'date' => $request->type === 'oneoff' ? $request->date : null,
        'start_time' => $request->start_time,
        'end_time' => $request->end_time,
    ]);

    return redirect()->route('doctor.schedule.index')->with('success','Schedule updated successfully!');
}

    public function destroy($id)
    {
        $schedule = DoctorSchedule::findOrFail($id);
        $schedule->delete();
    
        return redirect()->route('doctor.schedule.index')
                         ->with('success', 'Schedule deleted successfully.');
    }
    
    
}