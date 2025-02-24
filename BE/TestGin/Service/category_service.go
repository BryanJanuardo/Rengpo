package Service

import (
	"context"
	"gin/Model"
	"gin/Repository"
)

type CategoryService struct{
	Repository *Repository.CategoryRepository
}

func NewCategoryService(repo *Repository.CategoryRepository) CategoryService {
	return CategoryService {
		Repository: repo,
	}
} 

func (ser *CategoryService) GetCategories(ctx context.Context) ([]Model.Category, error) {
	return ser.Repository.FetchAll(ctx);
}