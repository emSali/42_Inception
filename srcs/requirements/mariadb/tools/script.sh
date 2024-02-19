#!/bin/bash

service mariadb start

mysql -e "CREATE DATABASE IF NOT EXISTS mariadb;"

mysql -e "CREATE USER IF NOT EXISTS 'esali'@'%' IDENTIFIED BY '12345';"

mysql -e "GRANT ALL PRIVILEGES ON mariadb.* TO 'esali'@'%';"

mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root12345';"

#refresh privileges
mysql -e "FLUSH PRIVILEGES:"

#modify root user
mysql -u root --skip-password  -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root12345';"

#restart MYSQL
#kill $(cat /var/run/mysqld/mysqld.pid)
mysqladmin -u root -p12345 shutdown
exec "mysqld_safe"
