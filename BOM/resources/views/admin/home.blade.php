<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Missing Products</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    
</head>
<body>
    @extends('admin.layouts.master')
    @section('content')
    <div class="container py-4">
    <h1 class="mb-4 text-center">Dashboard</h1>

    <div class="row g-3 justify-content-center">
        <!-- New Products Small Card -->
        <div class="col-6 col-md-3">
            <div class="card shadow-sm text-center border-0" style="background: #4CAF50; color: #fff; padding: 20px;">
                <i class="bi bi-plus-circle-fill" style="font-size: 28px;"></i>
                <h6 class="mt-2">New Products</h6>
                <p class="mb-0 display-6">{{ $newCount }}</p>
            </div>
        </div>

        <!-- Old Products Small Card -->
        <div class="col-6 col-md-3">
            <div class="card shadow-sm text-center border-0" style="background: #FF9800; color: #fff; padding: 20px;">
                <i class="bi bi-clock-history" style="font-size: 28px;"></i>
                <h6 class="mt-2">Old Products</h6>
                <p class="mb-0 display-6">{{ $oldCount }}</p>
            </div>
        </div>
    </div>
</div>
    @endsection
    <!-- Bootstrap Bundle JS (for responsive features) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
