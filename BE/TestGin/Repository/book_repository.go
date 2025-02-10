package Repository

import (
	"context"
	"fmt"
	"log"
	"time"

	"gin/Database"
	"gin/Model"

	"github.com/go-redis/redis/v8"
	jsoniter "github.com/json-iterator/go"
)

type BookRepository struct {
	DB *Database.Instance
}

func NewBookRepository() *BookRepository {
	return &BookRepository{
		DB: Database.NewDB(),
	}
}

func (r *BookRepository) FetchAll (ctx context.Context) ([]Model.Book, error){
	var json = jsoniter.ConfigCompatibleWithStandardLibrary;
	var books []Model.Book;

	cache, err := r.DB.Redis.Get(ctx, "books:all").Result();
	
	if err == nil {
		err := json.Unmarshal([]byte(cache), &books);
		if err == nil {
			return books, nil;
		}
		log.Printf("Unmarshal Cache Value Error: %v", err);
	}

	query := "SELECT * FROM books";
	err = r.DB.MySql.Select(&books, query);
	if err != nil {
		log.Printf("Query SQL Error: %v", err);
		return nil, err;
	}

	dataJson, err := json.Marshal(books);
	if(err == nil) {
		_, err := r.DB.Redis.Set(ctx, "books:all", dataJson, 1 * time.Minute).Result();
		if err != nil {
			log.Printf("Cache Set Error: %v", err);
		}
	}

	return books, nil;
}

func (r *BookRepository) FindId (ctx context.Context, id uint) (error) {
	key := fmt.Sprintf("books:%d", id);
	_, err := r.DB.Redis.Get(ctx, key).Result();
	
	if err == nil {
		return nil;
	}
	
	if err != redis.Nil {
		return err;
	}
	
	query := "SELECT * FROM books WHERE id = ?";
	var book Model.Book;
	err = r.DB.MySql.Get(&book, query, id);
	
	if err != nil {
		return fmt.Errorf("book not found");
	}

	return nil;
}

func (r *BookRepository) FetchById (ctx context.Context, id uint) (*Model.Book, error) {
	var json = jsoniter.ConfigCompatibleWithStandardLibrary;
	var book Model.Book;

	key := fmt.Sprintf("books:%d", id);
	cache, err := r.DB.Redis.Get(ctx, key).Result();
	
	if err == nil {
		err := json.Unmarshal([]byte(cache), &book);
		if err == nil {
			return &book, nil;
		}
		log.Printf("Unmarshal Cache Value Error: %v", err);
	}

	query := "SELECT * FROM books WHERE id = ?";
	row := r.DB.MySql.QueryRow(query, id)
	err = row.Scan(&book.ID, &book.Title, &book.Author, &book.Quantity, &book.CategoryID);
	if err != nil {
		log.Printf("Query SQL Error: %v", err);
		return nil, err;
	}

	dataJson, err := json.Marshal(book);
	if(err == nil) {
		_, err := r.DB.Redis.Set(ctx, key, dataJson, 1 * time.Minute).Result();
		if err != nil {
			log.Printf("Cache Set Error: %v", err);
		}
	}

	return &book, nil;
}

func (r *BookRepository) Store(ctx context.Context, newBook Model.Book) (*Model.Book, error) {
	var json = jsoniter.ConfigCompatibleWithStandardLibrary;
	var book Model.Book;

	query := "INSERT INTO books (title, author, quantity, category_id) VALUES (?, ?, ?, ?)";

	res, err := r.DB.MySql.Exec(query, newBook.Title, newBook.Author, newBook.Quantity, newBook.CategoryID);
	if err != nil {
		log.Printf("Query SQL Error: %v", err);
		return nil, err;
	}
	
	id, err := res.LastInsertId()
	if err != nil {
		log.Printf("Failed to Retrieve Last ID Error: %v", err);
		return nil, err;
	}

	book = newBook;
	book.ID = uint(id);
	key := fmt.Sprintf("books:%d", id);

	dataJson, err := json.Marshal(book);
	if(err == nil) {
		_, err = r.DB.Redis.Set(ctx, key, dataJson, 1 * time.Minute).Result();
		if err != nil {
			log.Printf("Cache Set Error: %v", err);
		}
	}

	return &book, nil;
}

func (r *BookRepository) Update(ctx context.Context, newBook Model.Book, id uint) (*Model.Book, error) {
	var json = jsoniter.ConfigCompatibleWithStandardLibrary;
	var book Model.Book;

	query := "UPDATE books SET title = ?, author = ?, quantity = ?, category_id = ? WHERE id = ?";

	_, err := r.DB.MySql.Exec(query, newBook.Title, newBook.Author, newBook.Quantity, newBook.CategoryID, id);
	if err != nil {
		log.Printf("Query SQL Error: %v", err);
		return nil, err;
	}

	book = newBook;
	book.ID = uint(id);
	key := fmt.Sprintf("books:%d", id);

	dataJson, err := json.Marshal(book);
	if(err == nil) {
		_, err = r.DB.Redis.Set(ctx, key, dataJson, 1 * time.Minute).Result();
		if err != nil {
			log.Printf("Cache Set Error: %v", err);
		}
	}

	return &book, nil;
}

func (r *BookRepository) Delete(ctx context.Context, id uint) (error) {
	query := "DELETE FROM books WHERE id = ?";

	_, err := r.DB.MySql.Exec(query, id);
	if err != nil {
		log.Printf("Query SQL Error: %v", err);
		return err;
	}

	key := fmt.Sprintf("books:%d", id);
	
	_, err = r.DB.Redis.Del(ctx, key).Result();
	if err != nil {
		log.Printf("Cache Del Error: %v", err);
	}

	return nil;
}

func (r *BookRepository) Paginate(ctx context.Context, page int) ([]Model.Book, error) {
	var json = jsoniter.ConfigCompatibleWithStandardLibrary;
	var books []Model.Book;
	var limit = 10;
	
	var key = fmt.Sprintf("books:page:%d", page);
	cache, err := r.DB.Redis.Get(ctx, key).Result();
	
	if err == nil {
		err := json.Unmarshal([]byte(cache), &books);
		if err == nil {
			return books, nil;
		}
		log.Printf("Unmarshal Cache Value Error: %v", err);
	}
	
	var offset = (page - 1) * limit;
	query := "SELECT * FROM books LIMIT ? OFFSET ?";

	err = r.DB.MySql.Select(&books, query, limit, offset);
	if err != nil {
		log.Printf("Query SQL Error: %v", err);
		return nil, err;
	}

	dataJson, err := json.Marshal(books);
	if(err == nil) {
		_, err := r.DB.Redis.Set(ctx, "books:all", dataJson, 1 * time.Minute).Result();
		if err != nil {
			log.Printf("Cache Set Error: %v", err);
		}
	}

	return books, nil;
}