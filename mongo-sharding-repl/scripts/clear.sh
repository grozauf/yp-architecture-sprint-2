#!/bin/sh

docker compose stop
docker-compose rm -f -v -s
docker volume rm -f mongo-sharding-repl_config-data mongo-sharding-repl_mongos_router-data mongo-sharding-repl_shard1-data mongo-sharding-repl_shard1_r1-data  mongo-sharding-repl_shard1_r2-data mongo-sharding-repl_shard2-data mongo-sharding-repl_shard2_r1-data mongo-sharding-repl_shard2_r2-data
docker network rm mongo-sharding-repl_app-network

