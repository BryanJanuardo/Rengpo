package Database

import (
	"github.com/go-redis/redis/v8" // go get -u github.com/go-redis/redis/v8
)

func SetupRedis(host string, port string, password string) *redis.Client {
	client := redis.NewClient(&redis.Options{
		Addr: host + ":" + port,
		Password: password,
		DB: 0,
	});
	// log.Printf("%v %v", host, password);
	return client
}