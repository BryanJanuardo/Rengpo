<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\Category;
use App\Models\Product;
use CodeIgniter\API\ResponseTrait;

class ProductController extends BaseController
{
    use ResponseTrait;
    public function index()
    {
        $model = new Product();
        $products = $model->findAll();

        return $this->respond($products);
    }

    public function show($id)
    {
        $model = new Product();
        $product = $model->find($id);

        return $this->respond($product);
    }

    public function store()
    {
        $data = $this->request->getJSON(true);
        $model = new Product();
        $product = $model->insert($data);

        return $this->respondCreated($product);
    }

    public function deleteByName($name)
    {
        $model = new Product();
        $product = $model->where('name', $name)->first();
        $model->delete($product['id']);

        return $this->respondDeleted($product);
    }

    public function update($id)
    {
        $model = new Product();
        $product = $model->find($id);

        $data = $this->request->getJSON(true);
        $model->update($id, $data);

        return $this->respond($product, 200);
    }

    public function productsCategory(){
        $model = new Product();
        $products = $model->category();

        return $this->respond($products);
    }

    public function categoryProducts(){
        $model = new Category();
        $categories = $model->products();

        return $this->respond($categories);
    }
}
