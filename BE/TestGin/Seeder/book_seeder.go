package Seeder

import (
	"fmt"
	"gin/Model"
	"math/rand"
	"time"
)

func seedBook(categories []Model.Category) []Model.Book{

	var books []Model.Book;
	random := rand.New(rand.NewSource(time.Now().UTC().UnixNano()));
	for i := 0; i < 30; i++ {
		books = append(books, Model.Book{
			ID: uint(i),
			Title: fmt.Sprintf("Book %d", i),
			Author: fmt.Sprintf("Author %d", i),
			Quantity: random.Intn(25),
			CategoryID: categories[random.Intn(len(categories))],
		});
	}

	return books;
}