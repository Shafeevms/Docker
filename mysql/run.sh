#!/usr/bin/env bash

docker run \
--name mysql \
--network web-server \
--volume /Users/safeevmaksim/Documents/skillbox/Docker/mysql/volumes:/var/lib/mysql \
--volume /Users/safeevmaksim/Documents/skillbox/Docker/mysql/dumps:/dumps \
-d \
-e MYSQL_DATABASE="test" \
-e MYSQL_PASSWORD="123123" \
-e MYSQL_ROOT_PASSWORD="123123" \
-e MYSQL_USER=test \
-e SERVICE_NAME=mysql \
-p 3306:3306 \
mariadb:10.3
