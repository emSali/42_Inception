#!/bin/sh

service mariadb start;

mysql -e "CREATE DATABASE IF NOT EXISTS Test_DB;"

mysql -e "CREATE USER IF NOT EXISTS 'esali'@'%' IDENTIFIED BY '12345';"

mysql -e "GRANT ALL PRIVILEGES ON Test_DB.* TO 'esali'@'%' IDENTIFIED BY '12345';"

#modify root user
mysql -u root --skip-password  -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345';"

#refresh privileges
mysql  -e "FLUSH PRIVILEGES;"

#restart MYSQL
kill $(cat /var/run/mysqld/mysqld.pid)
mysqld_safe
