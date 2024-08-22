#!/bin/sh

echo "###### shard1: docs count"
docker compose exec -T shard1 mongosh --port 27018 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
exit
EOF

echo "\n###### shard2: docs count"
docker compose exec -T shard2 mongosh --port 27021 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
exit
EOF

echo "\n###### router: docs count"
docker compose exec -T mongos_router mongosh --port 27024 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
exit
EOF  
