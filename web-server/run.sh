#!/usr/bin/env bash
docker run \
--name web-server \
--network web-server \
--volume /Users/safeevmaksim/Documents/skillbox/Docker/web-server/volumes/sites-available:/etc/apache2/sites-available \
--volume /Users/safeevmaksim/Documents/skillbox/www-php:/var/www \
-d \
-p 80:80 \
web-server

