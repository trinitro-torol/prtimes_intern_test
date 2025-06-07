#!/bin/bash

set -e

source .env

echo "==> Applying tuning SQL from $SQL_FILE to MySQL container $CONTAINER_NAME ..."

docker exec -i $CONTAINER_NAME mysql -u root -p$MYSQL_PASSWORD $DATABASE_NAME < $SQL_FILE

echo "==> Done."