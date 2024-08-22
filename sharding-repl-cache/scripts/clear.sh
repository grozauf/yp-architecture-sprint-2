#!/bin/sh

docker compose stop
docker-compose rm -f -v -s
docker volume rm -f sharding-repl-cache_config-data sharding-repl-cache_mongos_router-data \
                    sharding-repl-cache_shard1-data sharding-repl-cache_shard1_r1-data sharding-repl-cache_shard1_r2-data \
                    sharding-repl-cache_shard2-data sharding-repl-cache_shard2_r1-data sharding-repl-cache_shard2_r2-data \
                    sharding-repl-cache_redis_1_data sharding-repl-cache_redis_2_data sharding-repl-cache_redis_3_data \
                    sharding-repl-cache_redis_4_data sharding-repl-cache_redis_5_data sharding-repl-cache_redis_6_data
docker network rm sharding-repl-cache_app-network

