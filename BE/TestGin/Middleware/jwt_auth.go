package Middleware

import (
	"gin/Service"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt"
)

func AuthJWT() gin.HandlerFunc {
	return func(c *gin.Context) {
		const BEARER_SCHEMA = "Bearer ";
		authHeader := c.GetHeader("Authorization");
		tokenString := authHeader[len(BEARER_SCHEMA):];

		token, err := Service.NewJwtService().ValidateToken(tokenString);

		if token.Valid {
			claims := token.Claims.(jwt.MapClaims)
			log.Println(claims);
		}else {
			c.JSON(http.StatusUnauthorized, gin.H{"messages": err.Error()})
			c.AbortWithStatus(http.StatusUnauthorized);
		}
	}
}