@extends('admin.layouts.master')
@section('content')
<div class="container mt-4">
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white">
            <h5 class="mb-0">Add Missing Product</h5>
        </div>
        <div class="card-body">

            @if ($errors->any())
                <div class="alert alert-danger">
                    <ul class="mb-0">
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            <form action="{{ route('admin.add.missing-products.store') }}" method="POST" enctype="multipart/form-data">
                @csrf

                <div class="row">
                    <div class="col-md-6 mt-3">
                        <label>Barcode</label>
                        <input type="text" name="barcode" class="form-control" required>
                    </div>

                    <div class="col-md-6 mt-3">
                        <label>Product Name</label>
                        <input type="text" name="product_name" class="form-control" required>
                    </div>

                    <div class="col-md-6 mt-3">
                        <label>Brand</label>
                        <input type="text" name="product_brand" class="form-control">
                    </div>

                    <div class="col-md-6 mt-3">
                        <label>Type</label>
                        <input type="text" name="product_type" class="form-control">
                    </div>

                    <div class="col-md-6 mt-3">
                        <label>Barcode Photo</label>
                        <input type="file" name="barcode_photo" class="form-control-file">
                    </div>

                    <div class="col-md-6 mt-3">
                        <label>Ingredient Photo</label>
                        <input type="file" name="ingredient_photo" class="form-control-file">
                    </div>

                    <div class="col-12 mt-3">
                        <label>Product Images (Multiple)</label>
                        <input type="file" name="product_images[]" multiple class="form-control-file">
                    </div>
                </div>

                <div class="mt-4">
                    <button type="submit" class="btn btn-success">Save Product</button>
                    <a href="{{ route('admin.oldproducts') }}" class="btn btn-secondary">Cancel</a>
                </div>
            </form>

        </div>
    </div>
</div>
@endsection
