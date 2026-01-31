<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\AddMissingProductsController;
use App\Http\Middleware\AdminMiddleware;
use Illuminate\Support\Facades\Artisan;


// routes/web.php
Route::get('/clear-all', function() {
    Artisan::call('config:clear');
    Artisan::call('cache:clear');
    Artisan::call('route:clear');
    Artisan::call('view:clear');
    return "All caches cleared!";
});



Route::get('/', function () {
   if (Auth::check()) {
      return redirect('/admin/home');
    }
    return redirect('/login');
});

Route::get('/privacy-policy', function () {
    return view('privacy_policy');
});




Route::middleware(['auth', 'admin'])->group(function () {
    Route::get('/admin/home', [DashboardController::class, 'home'])->name('admin.home');

    Route::get('/admin/dashboard', [DashboardController::class, 'index'])->name('admin.dashboard');
    Route::get('/admin/products/export', [DashboardController::class, 'export'])->name('admin.products.export');

    Route::get('/admin/old/products', [DashboardController::class, 'oldproducts'])->name('admin.oldproducts');
    Route::get('/admin/products/export/old', [DashboardController::class, 'exportOld'])
    ->name('admin.products.export.old');

    // Add Missing Products
    Route::get('/admin/add/missing-products', [AddMissingProductsController::class, 'create'])->name('admin.add.missing-products');
    Route::post('/admin/add/missing-products/store', [AddMissingProductsController::class, 'store'])->name('admin.add.missing-products.store');
});

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
