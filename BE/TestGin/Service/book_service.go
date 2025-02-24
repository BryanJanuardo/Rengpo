package Service

import (
	"context"
	"gin/Model"
	"gin/Repository"
	"strconv"
)

type BookService struct{
	Repository *Repository.BookRepository
}

func NewBookService(repo *Repository.BookRepository) BookService {
	return BookService {
		Repository: repo,
	}
} 

func (ser *BookService) GetBooks(ctx context.Context) ([]Model.Book, error) {
	return ser.Repository.FetchAll(ctx);
}

func (ser *BookService) GetBooksByCategoryId(ctx context.Context, categoryId string, currPage string) ([]Model.Book, error) {
	id, err := strconv.ParseUint(categoryId, 10, 32);
	page, err := strconv.ParseInt(currPage, 10, 32);
	if err != nil {
		return nil, err;
	}
	return ser.Repository.FetchAllByCategoryId(ctx, uint(id), int(page));
}

func (ser * BookService) GetBook(ctx context.Context, bookId string) (*Model.Book, error) {
	id, err := strconv.ParseUint(bookId, 10, 32);
	if err != nil {
		return nil, err;
	}

	return ser.Repository.FetchById(ctx, uint(id));
}

func (ser * BookService) TotalPage(ctx context.Context) (*int64, error) {
	return ser.Repository.TotalPage(ctx);
}

func (ser * BookService) TotalPageByCategoryId(ctx context.Context, categoryId string) (*int64, error) {
	id, err := strconv.ParseUint(categoryId, 10, 32);
	if err != nil {
		return nil, err;
	}

	return ser.Repository.TotalPageByCategoryId(ctx, uint(id));
}

func (ser * BookService) Store(ctx context.Context, book Model.Book) (*Model.Book, error) {
	return ser.Repository.Store(ctx, book);
}

func (ser * BookService) Update(ctx context.Context, book Model.Book, bookId string) (*Model.Book, error) {
	id, err := strconv.ParseUint(bookId, 10, 32);
	if err != nil {
		return nil, err;
	}

	return ser.Repository.Update(ctx, book, uint(id));
}
func (ser * BookService) Delete(ctx context.Context, bookId string) (error) {
	id, err := strconv.ParseUint(bookId, 10, 32);
	if err != nil {
		return err;
	}

	return ser.Repository.Delete(ctx, uint(id));
}

func (ser * BookService) Paginate(ctx context.Context, page string) ([]Model.Book, error) {
	pag, err := strconv.ParseInt(page, 10, 32);
	if err != nil {
		return nil, err;
	}
	
	return ser.Repository.Paginate(ctx, int(pag));
}