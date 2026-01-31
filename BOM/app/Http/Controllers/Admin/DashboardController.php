<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\MissingProduct;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\MissingProductsExport; 

class DashboardController extends Controller
{
    
    public function home()
    {
        $newCount = MissingProduct::where('status','new')->count();
        $oldCount = MissingProduct::where('status','old')->count();
        return view('admin.home',compact('newCount','oldCount'));
    }
    public function index()
    {
        
        $products = MissingProduct::where('status','new')->orderBy('created_at', 'desc')->paginate(15);
        return view('admin.dashboard', compact('products'));
    }

    public function export()
{
    // Step 1: Check if new products exist
    $newProducts = MissingProduct::where('status', 'new')->get();

    if ($newProducts->isEmpty()) {
        return redirect()->back()->with('error', 'No new products to export.');
    }

    // Step 2: Download Excel file of new products
    $fileName = 'missing_products_' . now()->format('Ymd_His') . '.xlsx';
    $download = Excel::download(new MissingProductsExport('new'), $fileName);

    // Step 3: Update status to 'old' AFTER Excel generated
    MissingProduct::where('status', 'new')->update(['status' => 'old']);

    // Step 4: Return file download
    return $download;
}

public function exportOld()
    {
        $oldProducts = MissingProduct::where('status', 'old')->get();

        if ($oldProducts->isEmpty()) {
            return redirect()->back()->with('error', 'No old products found to export.');
        }

        $fileName = 'old_missing_products_' . now()->format('Ymd_His') . '.xlsx';

        // ✅ Export only old products
        return Excel::download(new MissingProductsExport('old'), $fileName);
    }

    public function oldproducts()
    {
        $products = MissingProduct::where('status' , 'old')->paginate(15);
        return view('admin.old_products', compact('products'));
    }
    
}