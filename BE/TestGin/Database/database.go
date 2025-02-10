package Database

import (
	"gin/Config"

	"github.com/go-redis/redis/v8"
	"github.com/jmoiron/sqlx"
)

type Instance struct {
	Redis *redis.Client
	MySql *sqlx.DB
}

var (
	db *Instance
)

func NewDB() *Instance {
	if db == nil {
		db = initialize();
	}

	return db;
}

func initialize() *Instance{
	cfg := Config.LoadConfig();
	ins := &Instance{
		Redis: SetupRedis(cfg.REDIS_HOST, cfg.REDIS_PORT, cfg.REDIS_PASSWORD),
		MySql: SetupMysql(cfg.DB_USERNAME, cfg.DB_PASSWORD, cfg.DB_HOST, cfg.DB_PORT, cfg.DB_DATABASE, cfg.DB_PARSETIME),
	};

	return ins;
}