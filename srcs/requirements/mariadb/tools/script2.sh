#!/bin/bash

service mysqld start;

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}';"

mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

#modify root user
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

#refresh privileges
mysql -e "FLUSH PRIVILEGES;"

#restart MYSQL
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
mysqld_safe


