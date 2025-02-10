package Seeder

import (
	"fmt"
	"gin/Model"
)

func seedCategory() []Model.Category{

	var categories []Model.Category;

	for i := 0; i < 5; i++ {
		categories = append(categories, Model.Category{
			CategoryID: uint(i),
			Name: fmt.Sprintf("Category %d", i),
		});
	}

	return categories;
}