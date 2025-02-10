package Middleware

import (
	"gin/Repository"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
)

func ValidateBookId() gin.HandlerFunc {
	return func(c *gin.Context) {
		param := c.Params.ByName("id");
		id, err := strconv.ParseUint(param, 10, 32);
		if err != nil {
			return;
		}

		err = Repository.NewBookRepository().FindId(c, uint(id));
		if err != nil {
			c.JSON(http.StatusNotFound, gin.H{"messages": err.Error()})
			c.AbortWithStatus(http.StatusNotFound);
		}
		c.Next();
	}
}
