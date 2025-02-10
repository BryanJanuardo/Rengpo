package Service

import (
	"fmt"
	"log"
	"time"

	"github.com/golang-jwt/jwt"
)

type JwtService interface {
	GenerateToken(username string, admin bool) string
	ValidateToken(token string) (*jwt.Token, error)
}

type JWTService struct {
	Name string `json:"name"`
	Admin bool `json:"admin"`
	jwt.StandardClaims
}

type jwtKey struct {
	secretKey string
	issuer string
}

func NewJwtService() JwtService {
	return &jwtKey {
		secretKey: getSecretKey(),
		issuer: "bryan",
	}
} 

func NewJwtKey() *jwtKey {
	return &jwtKey {
		secretKey: getSecretKey(),
		issuer: "bryan",
	}
}
func getSecretKey() string {
	return "secret";
}

func (jwtServ *jwtKey) GenerateToken(username string, admin bool) string {
	claims := &JWTService{
		username,
		admin,
		jwt.StandardClaims{
			ExpiresAt: time.Now().Add(time.Minute * 5).Unix(),
			Issuer: jwtServ.issuer,
			IssuedAt: time.Now().Unix(),
		},
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims);
	encodedToken, err := token.SignedString([]byte (jwtServ.secretKey))	;
	if err != nil {
		log.Println(err);
		return "";
	}

	return encodedToken;
}

func (jwtServ *jwtKey) ValidateToken(tokenString string) (*jwt.Token, error) {
	return jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
		_, ok := token.Method.(*jwt.SigningMethodHMAC);

		if (!ok) {
			return nil, fmt.Errorf("unexpected signing method: %v", token.Header["alg"]);
		}

		return []byte(jwtServ.secretKey), nil;
	});
}