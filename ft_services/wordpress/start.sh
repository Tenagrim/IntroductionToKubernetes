#!/bin/sh
IP=$(cat /ip.txt)
sed -i "s/XXXXXXXXXX/$IP/g" /var/www
php -S 0.0.0.0:5050 -t /var/www
