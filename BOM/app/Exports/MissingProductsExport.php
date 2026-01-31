<?php
namespace App\Exports;

use App\Models\MissingProduct;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Illuminate\Support\Facades\URL;

class MissingProductsExport implements FromCollection, WithHeadings
{
    protected $statusHit;

    public function __construct($statusHit)
    {
        $this->statusHit = $statusHit;
    }

    public function collection()
    {
        $query = MissingProduct::query();

        // ✅ Corrected filtering logic
        if ($this->statusHit === 'new') {
            $query->where('status', 'new');
        } elseif ($this->statusHit === 'old') {
            $query->where('status', 'old'); // previously incorrect (was also 'new')
        }

        $products = $query->get();

        return $products->map(function ($product) {
            $barcodeUrl = $product->barcode_photo_path ? URL::to($product->barcode_photo_path) : '';
            $ingredientUrl = $product->ingredient_photo_path ? URL::to($product->ingredient_photo_path) : '';

            $productImages = $product->product_images_paths;
            if (is_string($productImages)) {
                $productImages = json_decode($productImages, true);
            }

            $productImages = is_array($productImages) ? $productImages : [];
            $fullImageUrls = array_map(fn($path) => URL::to(trim($path, '/')), $productImages);

            return [
                'ID' => $product->id,
                'Product Name' => $product->product_name,
                'Barcode' => $product->barcode,
                'Brand' => $product->product_brand,
                'Type' => $product->product_type,
                'Barcode Photo URL' => $barcodeUrl,
                'Ingredient Photo URL' => $ingredientUrl,
                'Product Images URLs' => implode(', ', $fullImageUrls),
                'Status' => $product->status,
                'Created At' => $product->created_at,
                'Updated At' => $product->updated_at,
            ];
        });
    }

    public function headings(): array
    {
        return [
            'ID',
            'Product Name',
            'Barcode',
            'Brand',
            'Type',
            'Barcode Photo URL',
            'Ingredient Photo URL',
            'Product Images URLs',
            'Status',
            'Created At',
            'Updated At',
        ];
    }
}
