#!/bin/sh




mariadb-install-db -u root

mysqld -u root & sleep 5

if [[ ! -z "`mysql -qfsBe "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME='gshona_db'" 2>&1`" ]];
then
  echo "DATABASE ALREADY EXISTS"
else
	echo "DATABASE DOES NOT EXIST"
	mysql -u root --execute="CREATE DATABASE gshona_db; CREATE USER 'admin'@'%' IDENTIFIED BY 'admin'; GRANT ALL PRIVILEGES ON gshona_db.* TO 'admin'@'%'; FLUSH PRIVILEGES;"
	mysql -u root -p gshona_db --skip-password < /tmp/gshona_db.sql
fi


#mysql -u root --execute="SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = 'DBName';"


mysqladmin shutdown

mysqld -u root
