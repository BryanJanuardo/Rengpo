package Repository

import "gin/Database"

type AuthRepository struct {
	DB *Database.Instance
	AuthorizeName string
	AuthorizePass string
}

func NewAuthRepository() *AuthRepository {
	return &AuthRepository{
		DB: Database.NewDB(),
		AuthorizeName: "bryan",
		AuthorizePass: "pass",
	}
}