<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;
use Faker\Factory;

class ProductSeeder extends Seeder
{
    public function run()
    {
        // $faker = Faker\Factory::create();
        for($i = 0; $i < 10; $i++) {
            $this->db->table('products')->insert([
                'name' => 'Product ' . $i,
                'price' => rand(100, 1000),
                'description' => 'Description ' . $i,
                'category_id' => rand(1, 4)
            ]);
        }
    }
}
