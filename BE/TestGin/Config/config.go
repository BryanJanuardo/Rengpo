package Config

import (
	"log"
	"os"

	"github.com/joho/godotenv"
)

type Config struct {
	REDIS_HOST     string
	REDIS_PORT     string
	REDIS_PASSWORD string

	DB_HOST     	string
	DB_DATABASE 	string
	DB_USERNAME 	string
	DB_PASSWORD 	string
	DB_DRIVER   	string
	DB_PORT    	 	string
	DB_PARSETIME   	string

	APP_PORT	   string
}

func LoadConfig() *Config {
	err := godotenv.Load(".env")
	if err != nil {
		log.Println("Env File not found");
	}

	return &Config{
		REDIS_HOST:     os.Getenv("REDIS_HOST"),
		REDIS_PORT:     os.Getenv("REDIS_PORT"),
		REDIS_PASSWORD: os.Getenv("REDIS_PASSWORD"),

		DB_HOST:     	os.Getenv("DB_HOST"),
		DB_DATABASE:	os.Getenv("DB_DATABASE"),
		DB_USERNAME: 	os.Getenv("DB_USERNAME"),
		DB_PASSWORD: 	os.Getenv("DB_PASSWORD"),
		DB_DRIVER:   	os.Getenv("DB_DRIVER"),
		DB_PORT:     	os.Getenv("DB_PORT"),
		DB_PARSETIME:	os.Getenv("DB_PARSETIME"),

		APP_PORT:		os.Getenv("APP_PORT"),
	}
}