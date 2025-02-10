package Service

import (
	"context"
	"gin/Repository"
)

type AuthService struct {
	Repository *Repository.AuthRepository
}

func NewAuthService(repo *Repository.AuthRepository) AuthService {
	return AuthService{
		Repository: repo,
	}
}

func (serv *AuthService) Login(c context.Context, username string, password string) bool {
	return serv.Repository.AuthorizeName == username && serv.Repository.AuthorizePass == password;
}

