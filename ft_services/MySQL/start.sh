#!/bin/sh




mariadb-install-db -u root

mysqld -u root & sleep 5

mysql -u root --execute="CREATE DATABASE gshona_db; CREATE USER 'admin'@'%' IDENTIFIED BY 'admin'; GRANT ALL PRIVILEGES ON gshona_db.* TO 'admin'@'%'; FLUSH PRIVILEGES;"

mysqladmin shutdown

mysqld -u root
