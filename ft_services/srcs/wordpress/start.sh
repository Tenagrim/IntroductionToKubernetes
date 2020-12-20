#!/bin/sh
#php -S 0.0.0.0:5050 -t /var/www
/usr/bin/supervisord -c /etc/supervisord.conf
