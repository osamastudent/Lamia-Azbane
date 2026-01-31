<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Old Products</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        /* Custom Styles for better visual appeal and image size */
        body {
            background-color: #f8f9fa; /* Light background */
        }
        .table-custom-card {
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
            border-radius: 0.5rem;
            overflow: hidden; /* Ensures table corners are rounded */
        }
        .table thead th {
            background-color: #e9ecef;
            color: #495057;
            font-weight: 700;
            font-size: 0.85rem;
            vertical-align: middle;
        }
        /* Style for image thumbnails */
        .image-thumb {
            width: 40px;
            height: 40px;
            object-fit: cover;
            border-radius: 4px;
            border: 1px solid #dee2e6;
            margin-right: 2px;
            transition: transform 0.2s;
        }
        .image-thumb:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    @extends('admin.layouts.master')
    @section('content')
    <div class="container py-4">
        
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="h3 fw-bold text-dark">Old Products</h1>
            
            <!-- Export Button -->
            <a href="{{ route('admin.products.export.old') }}" class="btn btn-success btn-sm shadow-sm d-flex align-items-center">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-download me-2" viewBox="0 0 16 16">
                    <path d="M.5 9.9a.5.5 0 0 1 .5.5v2.5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2.5a.5.5 0 0 1 1 0v2.5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2v-2.5a.5.5 0 0 1 .5-.5"/>
                    <path d="M7.646 11.854a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293V3.5a.5.5 0 0 0-1 0v6.793L5.354 8.146a.5.5 0 1 0-.708.708z"/>
                </svg>
                Download Data (Excel)
            </a>
        </div>

        <!-- Table Container -->
        <div class="table-custom-card bg-white">
            <div class="table-responsive">
                <table class="table table-striped table-hover mb-0">
                    <thead>
                        <tr>
                            <th scope="col" class="px-3">ID</th>
                            <th scope="col">Product Name</th>
                            <th scope="col">Brand / Type</th>
                            <th scope="col">Barcode</th>
                            <th scope="col" class="text-center">Product Photos</th>
                            <th scope="col">Submitted On</th>
                            <th scope="col" class="text-center">Action Links</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($products as $product)
                            <tr>
                                <td class="px-3 align-middle">{{ $product->id }}</td>
                                <td class="align-middle fw-semibold">{{ $product->product_name }}</td>
                                <td class="align-middle text-muted small">
                                    <span class="d-block"><strong>Brand:</strong> {{ $product->product_brand ?? 'N/A' }}</span>
                                    <span class="d-block"><strong>Type:</strong> {{ $product->product_type ?? 'N/A' }}</span>
                                </td>
                                <td class="align-middle">{{ $product->barcode ?? 'N/A' }}</td>
                                
                                <td class="align-middle">
                                    {{-- Product Images Decoding and Displaying in Table Cell --}}
                                    @php
                                        $productImages = is_string($product->product_images_paths) 
                                            ? json_decode($product->product_images_paths, true) 
                                            : ($product->product_images_paths ?? []);
                                        
                                        if (!is_array($productImages)) {
                                            $productImages = []; 
                                        }
                                    @endphp

                                    @if (count($productImages) > 0)
                                        <div class="d-flex flex-wrap align-items-center">
                                            @foreach (array_slice($productImages, 0, 3) as $key => $path)
                                                @if (!empty($path))
                                                    <a href="{{ url(trim('public'.$path, '/')) }}" target="_blank">
                                                        <img 
                                                            src="{{ url(trim('public'.$path, '/')) }}" 
                                                            alt="Image {{ $key + 1 }}"
                                                            class="image-thumb"
                                                        />
                                                    </a> 
                                                @endif
                                            @endforeach
                                            @if (count($productImages) > 3)
                                                <span class="text-secondary small ms-1">+{{ count($productImages) - 3 }}</span>
                                            @endif
                                        </div>
                                    @else
                                        <span class="text-secondary small fst-italic">No images</span>
                                    @endif
                                </td>
                                
                                <td class="align-middle small text-muted">{{ $product->created_at->format('Y-m-d H:i') }}</td>

                                <td class="align-middle text-center">
                                    <a href="{{ url($product->barcode_photo_path) }}" target="_blank" class="btn btn-outline-danger btn-sm mb-1" title="View Barcode">Barcode</a>
                                    <a href="{{ url($product->ingredient_photo_path) }}" target="_blank" class="btn btn-outline-danger btn-sm" title="View Ingredients">Ingredients</a>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
        
        <!-- Pagination Links -->
        <!-- Pagination Links -->
<div class="mt-4 d-flex justify-content-center">
    {{ $products->onEachSide(1)->links('pagination::bootstrap-5') }}
</div>

    </div>
    @endsection
    <!-- Bootstrap Bundle JS (for responsive features) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
