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
}
