#!/bin/sh

echo "#### configSrv setup...\n"

docker compose exec -T configSrv mongosh --port 27017 --quiet <<EOF
rs.initiate(
  {
    _id : "config_server",
       configsvr: true,
    members: [
      { _id : 0, host : "configSrv:27017" }
    ]
  }
);
exit(); 
EOF

echo "\n#### shard1 setup...\n"

docker compose exec -T shard1 mongosh --port 27018 --quiet <<EOF
rs.initiate(
    {
      _id : "shard1",
      members: [
        { _id : 0, host : "shard1:27018" },
        { _id : 1, host : "shard1_r1:27019" },
        { _id : 2, host : "shard1_r2:27020" }
      ]
    }
);
exit(); 
EOF

echo "\n#### shard2 setup...\n"

docker compose exec -T shard2 mongosh --port 27021 --quiet <<EOF
rs.initiate(
    {
      _id : "shard2",
      members: [
       { _id : 3, host : "shard2:27021" },
       { _id : 4, host : "shard2_r1:27022" },
       { _id : 5, host : "shard2_r2:27023" }
      ]
    }
);
exit(); 
EOF
