package Seeder

import "gin/Model"

func RunSeed() ([]Model.Book, []Model.Category){
	var categories = seedCategory();
	var books = seedBook(categories);

	return books, categories;
}