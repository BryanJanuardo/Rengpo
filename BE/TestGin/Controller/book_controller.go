package Controller

import (
	"gin/Model"
	"gin/Service"
	"log"
	"net/http"

	"github.com/gin-gonic/gin" // go get -u github.com/gin-gonic/gin
)

type BookController struct {
	Service Service.BookService
}

func NewBookController(service Service.BookService) BookController {
	return BookController {
		Service: service,
	}
}

func (con *BookController) FindAll(c *gin.Context) {
	ctx := c.Request.Context();
	books, err := con.Service.GetBooks(ctx);

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"message": err.Error()});
		return;
	}

	c.JSON(http.StatusOK, books);
}

func (con *BookController) TotalPageByCategoryId(c *gin.Context) {
	ctx := c.Request.Context();
	categoryId := c.Params.ByName("categoryId");
	totalPage, err := con.Service.TotalPageByCategoryId(ctx, categoryId);

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"message": err.Error()});
		return;
	}

	c.JSON(http.StatusOK, totalPage);
}

func (con *BookController) TotalPage(c *gin.Context) {
	ctx := c.Request.Context();
	totalPage, err := con.Service.TotalPage(ctx);

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"message": err.Error()});
		return;
	}

	c.JSON(http.StatusOK, totalPage);
}

func (con *BookController) FindByCategoryId(c *gin.Context) {
	ctx := c.Request.Context();
	categoryId := c.Params.ByName("categoryId");
	page := c.Params.ByName("page");
	books, err := con.Service.GetBooksByCategoryId(ctx, categoryId, page);

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"message": err.Error()});
		return;
	}

	c.JSON(http.StatusOK, books);
}

func (con * BookController) FindById(c * gin.Context) {
	ctx := c.Request.Context();
	id := c.Params.ByName("id");

	book, err := con.Service.GetBook(ctx, id);

	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"message": err.Error()});
		return;
	}

	c.JSON(http.StatusOK, book);
}

func (con * BookController) Store(c * gin.Context) {
	ctx := c.Request.Context();
	var newBook Model.Book;
	
	log.Println(c.Request.Body);
	err := c.BindJSON(&newBook);
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"message": err.Error()});
		return;
	}

	book, err := con.Service.Store(ctx, newBook);
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"message": err.Error()});
		return;
	}
	
	c.JSON(http.StatusCreated, book);
}

func (con * BookController) Update(c * gin.Context) {
	ctx := c.Request.Context();
	id := c.Params.ByName("id");
	var newBook Model.Book;

	err := c.BindJSON(&newBook);
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"message": err.Error()});
		return;
	}

	book, err := con.Service.Update(ctx, newBook, id);
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"message": err.Error()});
		log.Printf("Errror: %v", err);
		return;
	}

	c.JSON(http.StatusCreated, book);
}

func (con * BookController) Delete(c * gin.Context) {
	ctx := c.Request.Context();
	id := c.Params.ByName("id");

	err := con.Service.Delete(ctx, id);
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"message": err.Error()});
		log.Printf("Errror: %v", err);
		return;
	}

	c.JSON(http.StatusAccepted, gin.H{"message": "Book Deleted"});
}

func (con * BookController) Paginate(c * gin.Context) {
	ctx := c.Request.Context();
	page := c.Params.ByName("page");

	books, err := con.Service.Paginate(ctx, page);
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"message": err.Error()});
		log.Printf("Errror: %v", err);
		return;
	}

	c.JSON(http.StatusOK, books);
}




// func createBook(c *gin.Context){
// 	var newBook Model.Book

// 	err := c.BindJSON(&newBook);

// 	if(err != nil){
// 		c.IndentedJSON(http.StatusBadRequest, gin.H{"message": "error"});
// 		return;
// 	}

// 	books = append(books, newBook);
// 	c.IndentedJSON(http.StatusCreated, newBook);
// }

// func deleteBook(c *gin.Context){
// 	param := c.Params.ByName("id");
// 	id, err := strconv.ParseUint(param, 10, 32)

// 	if(err != nil){
// 		c.IndentedJSON(http.StatusBadRequest, gin.H{"message": "error"});
// 		return;
// 	}

// 	for i, book := range books{
// 		if book.ID == uint(id){
// 			books = append(books[:i], books[i+1:]...);
// 			break;
// 		}
// 	}
// }

// func updateBook(c *gin.Context) {
// 	param := c.Params.ByName("id");
// 	id, err := strconv.ParseUint(param, 10, 32)

// 	if(err != nil){
// 		c.IndentedJSON(http.StatusBadRequest, gin.H{"message": "error"});
// 		return;
// 	}

// 	for i, book := range books{
// 		if(book.ID == uint(id)){
// 			c.BindJSON(&books[i]);
// 			c.IndentedJSON(http.StatusOK, books[i]);
// 			break;
// 		}
// 	}

// 	c.IndentedJSON(http.StatusNotFound, gin.H{"message": "book not found"})
// }