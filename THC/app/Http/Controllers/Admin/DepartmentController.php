<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Department;
use App\Models\Specialization;

class DepartmentController extends Controller
{
    public function index()
    {
          $departments = Department::leftJoin('specializations', 'departments.specialization_id', '=', 'specializations.id')
            ->select(
                'departments.*',
                'specializations.name as specialization_name'
            )
            ->paginate(10);

        return view('admin.departments.index', compact('departments'));
    }
    public function create()
    {
        
        $specializations = Specialization::all();
        return view('admin.departments.create', compact('specializations'));
    }
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'specialization_id' => 'required'
        ]);

        Department::create($request->all());

        return redirect()->route('admin.departments.index')->with('success', 'Department created successfully!');
    }
    
     public function edit($id)
    {
        $department = Department::findOrFail($id);
        $specializations = Specialization::all();
        return view('admin.departments.edit', compact('department', 'specializations'));
    }

    public function update(Request $request, $id)
    {
        $department = Department::findOrFail($id);

        $request->validate([
            'name' => 'required|string|max:255',
            'specialization_id' => 'required|exists:specializations,id',
        ]);

        $department->update([
            'name' => $request->name,
            'specialization_id' => $request->specialization_id,
        ]);

        return redirect()->route('admin.departments.index')->with('success', 'Department updated successfully!');
    }

    public function destroy($id)
{
    $department = Department::find($id);

    if ($department) {
        $department->delete();

        return response()->json(['success' => true]);
    }

    return response()->json(['success' => false]);
}

}