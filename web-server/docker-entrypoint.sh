#!/usr/bin/env bash
a2ensite task1.skillbox.conf

service apache2 reload
apache2ctl -DFOREGROUND
