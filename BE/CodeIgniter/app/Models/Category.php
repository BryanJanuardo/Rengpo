<?php

namespace App\Models;

use CodeIgniter\Model;

class Category extends Model
{
    protected $table            = 'categories';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = ['name'];

    protected bool $allowEmptyInserts = false;
    protected bool $updateOnlyChanged = true;

    protected array $casts = [];
    protected array $castHandlers = [];

    // Dates
    protected $useTimestamps = false;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';

    // Validation
    protected $validationRules      = [];
    protected $validationMessages   = [];
    protected $skipValidation       = false;
    protected $cleanValidationRules = true;

    // Callbacks
    protected $allowCallbacks = true;
    protected $beforeInsert   = [];
    protected $afterInsert    = [];
    protected $beforeUpdate   = [];
    protected $afterUpdate    = [];
    protected $beforeFind     = [];
    protected $afterFind      = [];
    protected $beforeDelete   = [];
    protected $afterDelete    = [];

    public function products() {
        $builder = $this->db->table('categories');
        $builder->select('categories.id as category_id, categories.name as category_name, products.id as product_id, 
        products.name as product_name, products.price as product_price, products.description as product_description');
        $builder->join('products', 'products.category_id = categories.id');
        $rows = $builder->get()->getResultArray();

        $result = [];
        foreach ($rows as $row) {
            $categoryId = $row['category_id'];

            if(!isset($result[$categoryId])) {
                $result[$categoryId] = [
                    'category_id' => $categoryId,
                    'category_name' => $row['category_name'],
                    'products' => []
                ];
            }
            
            $result[$categoryId]['products'][$row['product_id']] = [
                'product_id' => $row['product_id'],
                'product_name' => $row['product_name'],
                'product_price' => $row['product_price'],
                'product_description' => $row['product_description']
            ];
        }

        return $result;
    }
}
