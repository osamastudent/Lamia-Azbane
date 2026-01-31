<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\MissingProduct;

class AddMissingProductsController extends Controller
{
    public function create(){
    
        return view('admin.create');
    }

    public function store(Request $request){

        $request->validate([
            'barcode'       =>   'required|unique:missing_products,barcode',
            'product_name'  =>   'required|string|max:255',
            'product_brand' =>  'required|string|max:255',
            'product_type'  =>   'required|string|max:255',
            'barcode_photo' =>  'required|image|mimes:jpg,jpeg,png|max:2048',
            'ingredient_photo' =>   'required|image|mimes:jpg,jpeg,png|max:2048',
            'product_images.*' =>   'required|image|mimes:jpg,jpeg,png|max:2048',

        ]);

       if($request->hasFile('barcode_photo')){
       $file = $request->file('barcode_photo');
       $filename = time() . '_' . $file->getClientOriginalName();
       $destinationPath = public_path('uploads/barcodes');
       $file-> move($destinationPath,$filename);
       $barcodePath = '/uploads/barcodes/' . $filename;
       
       }else{
        $barcodePath = null;
       }

       if($request->hasFile('ingredient_photo')){
       $file = $request->file('ingredient_photo');
       $filename = time() . '_' . $file->getClientOriginalName();
       $destinationPath = public_path('uploads/ingredients');
       $file-> move($destinationPath,$filename);
       $ingredientPath = '/uploads/ingredients/' . $filename;
       
       }else{
        $barcodePath = null;
       }

       $imagePaths = [];
       if($request->hasFile('product_images')){
        foreach($request->file('product_images') as $image){
            $filename = time() . '_' . $image->getClientOriginalName();
            $destinationPath = public_path('uploads/images');
            $image->move($destinationPath , $filename);
            $imagePaths[] = '/uploads/images/' . $filename;
        }
       }

       MissingProduct::create([
        'barcode' => $request->barcode,
        'product_name' => $request->product_name,
        'product_brand' => $request->product_brand,
        'product_type' => $request->product_type,
        'barcode_photo_path' => $barcodePath,
        'ingredient_photo_path' => $ingredientPath,
        'product_images_paths' => $imagePaths,
        'created_by' => auth()->id(),
       ]);

       return redirect()->route('admin.dashboard')->with('success', 'Missing product added successfully!');


    }
    
    
}