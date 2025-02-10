package Controller

import (
	"gin/Service"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

type AuthController struct {
	AuthService Service.AuthService
	JwtService Service.JwtService
}

type credentials struct {
	Username string `json:"username"`
	Password string `json:"password"`
}

func NewAuthController(authService Service.AuthService, jwtService Service.JwtService) AuthController {
	return AuthController{
		AuthService: authService,
		JwtService: jwtService,
	}
}

func (con *AuthController) Login(c *gin.Context){
	ctx := c.Request.Context();
	var cred credentials;
	err := c.BindJSON(&cred);
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"message": err.Error()});
		return;
	}

	isAuth := con.AuthService.Login(ctx, cred.Username, cred.Password);
	log.Println(isAuth);
	if isAuth {
		token := con.JwtService.GenerateToken(cred.Username, true);
		if token != "" {
			c.JSON(http.StatusOK, gin.H{"token": token})
			return;
		}else {
			c.JSON(http.StatusUnauthorized, nil);
			return;
		}
	}
	c.JSON(http.StatusUnauthorized, nil);
}