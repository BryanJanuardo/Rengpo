package Migration

import (
	"database/sql"
	"fmt"
	"gin/Config"
	"log"
	"os"
)

func RunMigration() {
	cfg := Config.LoadConfig();
	con := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?parseTime=%s", 
	cfg.DB_USERNAME, cfg.DB_PASSWORD, cfg.DB_HOST, cfg.DB_PORT, cfg.DB_DATABASE, cfg.DB_PARSETIME);

	db, err := sql.Open("mysql", con);
	if err != nil {
		log.Printf("Migration Error: %v", err);
	}

	defer db.Close();

	sqlFile, err := os.ReadFile("rengpo.sql");
	if err != nil {
		log.Printf("Migration Error: %v", err);
	}

	_, err = db.Exec(string(sqlFile));
	if err != nil {
		log.Printf("Migration Error: %v", err);
	}
	log.Println("Migration Success");
}