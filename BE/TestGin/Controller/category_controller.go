package Controller

import (
	"gin/Service"
	"net/http"

	"github.com/gin-gonic/gin" // go get -u github.com/gin-gonic/gin
)

type CategoryController struct {
	Service Service.CategoryService
}

func NewCategoryController(service Service.CategoryService) CategoryController {
	return CategoryController {
		Service: service,
	}
}

func (con *CategoryController) FindAll(c *gin.Context) {
	ctx := c.Request.Context();
	categories, err := con.Service.GetCategories(ctx);
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"message": err.Error()});
		return;
	}

	c.JSON(http.StatusOK, categories);
}