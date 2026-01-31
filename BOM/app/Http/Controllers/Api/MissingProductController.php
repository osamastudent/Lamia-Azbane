<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;

use App\Models\MissingProduct;
use Illuminate\Http\Request; // Sirf yahi use hoga
use Illuminate\Support\Facades\Storage; 

class MissingProductController extends Controller
{
    
     private function uploadFile($file, $subDirectory): string
    {
        
        $cleanSubDir = trim($subDirectory, '/'); 
        $fullPath = public_path($cleanSubDir);
        
        if (!file_exists($fullPath)) {
          
            mkdir($fullPath, 0777, true); 
        }
        $fileName = time() . '_' . uniqid() . '.' . $file->getClientOriginalExtension();
        $file->move($fullPath, $fileName);
        return '/' . $cleanSubDir . '/' . $fileName; 
    }

    /**
     * Store a newly created missing product in storage.
     */
    public function store(Request $request) 
    {
        // Validation logic is correct and remains the same
        $validatedData = $request->validate([
            'product_name'          => 'required|string|max:255',
            'barcode'               => 'required|string|max:50|unique:missing_products,barcode',
            'product_brand'         => 'required|string|max:255',
            'product_type'          => 'required|string|max:255',
            'barcode_photo'         => 'required|file|mimes:jpeg,png,jpg|max:5000', 
            'ingredient_photo'      => 'required|file|mimes:jpeg,png,jpg|max:5000',
            'product_images'        => 'required|array|max:5', 
            'product_images.*'      => 'file|mimes:jpeg,png,jpg|max:5000', 
        ]);


        $productImagePaths = [];
        $validatedData['barcode_photo_path'] = $this->uploadFile(
            $request->file('barcode_photo'), 
            'uploads/barcodes' 
        ); 

        $validatedData['ingredient_photo_path'] = $this->uploadFile(
            $request->file('ingredient_photo'), 
            'uploads/ingredients'
        );
        if ($request->hasFile('product_images')) {
            foreach ($request->file('product_images') as $image) {
                if ($image && $image->isValid()) {
                    $productImagePaths[] = $this->uploadFile(
                        $image, 
                        'uploads/images'
                    );
                }
            }
        }
        $validatedData['product_images_paths'] = $productImagePaths;
        $validatedData['status'] = 'new';

        $product = MissingProduct::create($validatedData); 

        return response()->json([
            'status'  => 'success',
            'message' => 'Product submitted successfully!',
            'data'    => $product
        ], 201);
    }
    
    public function index()
    {
        $products = MissingProduct::where('status', 'new')->get();
        return response()->json([
            'status' => 'success',
            'message' => 'Missing products list fetched successfully.',
            'data' => $products
        ]);
    }
}