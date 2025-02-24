package Repository

import (
	"context"
	"log"
	"time"

	"gin/Database"
	"gin/Model"

	jsoniter "github.com/json-iterator/go"
)

type CategoryRepository struct {
	DB *Database.Instance
}

func NewCategoryRepository() *CategoryRepository {
	return &CategoryRepository{
		DB: Database.NewDB(),
	}
}

func (r *CategoryRepository) FetchAll(ctx context.Context) ([]Model.Category, error) {
	var json = jsoniter.ConfigCompatibleWithStandardLibrary;
	var categories []Model.Category;

	cache, err := r.DB.Redis.Get(ctx, "categories:all").Result();
	
	if err == nil {
		err := json.Unmarshal([]byte(cache), &categories);
		if err == nil {
			return categories, nil;
		}
		log.Printf("Unmarshal Cache Value Error: %v", err);
	}

	query := "SELECT * FROM categories";
	err = r.DB.MySql.Select(&categories, query);
	if err != nil {
		log.Printf("Query SQL Error: %v", err);
		return nil, err;
	}

	dataJson, err := json.Marshal(categories);
	if(err == nil) {
		_, err := r.DB.Redis.Set(ctx, "categories:all", dataJson, 1 * time.Minute).Result();
		if err != nil {
			log.Printf("Cache Set Error: %v", err);
		}
	}

	return categories, nil;
}