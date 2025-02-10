<?php

namespace App\Database\Seeds;

use CodeIgniter\Database\Seeder;

class CategorySeeder extends Seeder
{
    public function run()
    {
        for($i = 0; $i < 4; $i++) {
            $this->db->table('categories')->insert([
                'name' => 'Category ' . $i,
            ]);
        }
    }
}
