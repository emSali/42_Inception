#!/bin/bash

service mysql start;

mysql -e "CREATE DATABASE IF NOT EXISTS Test_DB;"

mysql -e "CREATE USER IF NOT EXISTS `esali`@'localhost' IDENTIFIED BY '12345';"

mysql -e "GRANT ALL PRIVILEGES ON Test_DB.* TO `esali`@'%' IDENTIFIED BY '12345';"

#modify root user
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345';"

#refresh privileges
mysql -e "FLUSH PRIVILEGES;"

#restart MYSQL
mysqladmin -u root -p '12345'  shutdown
mysqld_safe
