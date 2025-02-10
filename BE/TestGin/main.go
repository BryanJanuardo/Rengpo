package main

import (
	"gin/Config"
	"gin/Router"
)

func main() {
	cfg := Config.LoadConfig();
	// Migration.RunMigration();

	router := Router.SetupRouter();
	router.Run(":" + cfg.APP_PORT);
	// router := gin.New();
	// books, categories = Seeder.RunSeed();
	
	// router.GET("/hello", hello);
	// router.GET("/books", getBooks);
	// router.GET("/categories", getCategories);
	// router.DELETE("/books/:id", deleteBook);
	// router.POST("/books", createBook);
	// router.PUT("/books/:id", updateBook);
	
	

	// //redis
	// redis := newRedisClient("localhost:6379", "");
	// context := context.Background();
	// book1 := data{
	// 	key: "book:1",
	// 	value: "book1",
	// 	ttl: time.Duration(3) * time.Second,
	// }

	// // Set Redis
	// err := redis.Set(context, book1.key, book1.value, book1.ttl).Err();

	// if(err != nil){
	// 	panic(err);
	// }

	// // Get Redis
	// value, err := redis.Get(context, book1.key).Result();

	// if(err != nil){
	// 	panic(err);
	// }

	// fmt.Println(value);

	// // go run main.go
	// router.Run(":9090");
}
