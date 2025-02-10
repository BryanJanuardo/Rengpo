package Router

import (
	"gin/Controller"
	"gin/Middleware"
	"gin/Repository"
	"gin/Service"

	"github.com/gin-gonic/gin"
)

var (
	bookService Service.BookService = Service.NewBookService(Repository.NewBookRepository())
	bookController Controller.BookController = Controller.NewBookController(bookService)

	authService Service.AuthService = Service.NewAuthService(Repository.NewAuthRepository());
	jwtService Service.JwtService = Service.NewJwtService();
	authController Controller.AuthController = Controller.NewAuthController(authService, jwtService);
)

func SetupRouter() *gin.Engine{
	router := gin.New();
	router.Use(gin.Recovery(), gin.Logger());

	apiv1 := router.Group("/api/v1")
	{
		apiv1.POST("/login", authController.Login);
		apiv1.GET("/tesjwt", Middleware.AuthJWT());
		bookApi := apiv1.Group("/books",)
		{
			bookApi.GET("/", bookController.FindAll);
			bookApi.GET("/page/:page", bookController.Paginate);
			bookApi.POST("/", bookController.Store);

			idBookApi := bookApi.Group("/:id")
			idBookApi.Use(Middleware.ValidateBookId());
			{
				idBookApi.GET("/", bookController.FindById);
				idBookApi.PUT("/", bookController.Update);
				idBookApi.DELETE("/", bookController.Delete);
			}
		}
	}

	// router.GET("/hello", hello);
	// router.GET("/books", Controller.GetBooks);
	// router.GET("/categories", getCategories);
	// router.DELETE("/books/:id", deleteBook);
	// router.POST("/books", createBook);
	// router.PUT("/books/:id", updateBook);

	return router;
}