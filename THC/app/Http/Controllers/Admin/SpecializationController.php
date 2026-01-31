<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Pagination\Paginator;
use App\Models\Specialization;

class SpecializationController extends Controller
{
    
    public function index(){
        $specializations = Specialization::orderBy('created_at' , 'desc')->get();
        return view('admin.specializations.index' , compact('specializations'));
    }
    
    public function create(){
        return view('admin.specializations.create');
    }
    
    public function store(Request $request){
        
        $request->validate([
            'name' => 'required|unique:specializations,name',
            'description' => 'nullable|string',
            ]);
            
         $data =  Specialization::create([
                'name' => $request->name,
                'description' => $request->description,
                'is_active' => $request->has('is_active')
                ]);
                
                
                
        return redirect()->route('admin.specializations.index')->with('success' , 'Specialization added successfully.');
    }
    
    public function edit($id){
        
        $specialization = Specialization::findOrFail($id);
        
        return view('admin.specializations.edit' , compact('specialization'));
    }

    public function update(Request $request , $id){
        
        $specialization = Specialization::findOrFail($id);
        
       $request->validate([
            'name' => 'required|unique:specializations,name,' . $id,
            'description' => 'nullable|string',
        ]);
        
        $specialization->update([
            'name' => $request->name,
            'description' => $request->description,
             'is_active' => $request->has('is_active')
            ]);
        
         return redirect()->route('admin.specializations.index')->with('success', 'Specialization updated successfully.');
    }
    
    public function destroy($id)
{
    $spec = Specialization::find($id);

    if (!$spec) {
        return response()->json(['success' => false]);
    }

    $spec->delete();
    return response()->json(['success' => true]);
}

    
    
    public function toggleStatus(Request $request)
{
    $spec =Specialization::find($request->id);

    if (!$spec) {
        return response()->json(['success' => false]);
    }

    $spec->is_active = !$spec->is_active;
    $spec->save();

    return response()->json([
        'success' => true,
        'is_active' => $spec->is_active
    ]);
}

    
    
}