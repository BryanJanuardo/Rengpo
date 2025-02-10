package Database

import (
	"fmt"
	"log"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
)

func SetupMysql(username string, password string, host string, port string, database string, parsetime string) *sqlx.DB {
	con := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?parseTime=%s", 
	username, password, host, port, database, parsetime);
	db, err := sqlx.Connect("mysql", con);
	
	if(err != nil) {
		log.Printf("Connection: %v", con);
		log.Printf("Error SQL: %v", err);
		panic(err);
	}

	return db;
}