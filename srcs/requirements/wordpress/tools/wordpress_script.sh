#!/bin/bash

sed -i "s/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/" "/etc/php/7.4/fpm/pool.d/www.conf";
#changes ownership of all files in /var/www/
chown -R www-data:www-data /var/www/*;
#gives permission 
chown -R 777 /var/www/*;
# creates directory and file (fastcgi process manager file storing runtime information)
mkdir -p /run/php/;
touch /run/php/php7.4-fpm.pid;

#check if wp-config.php exist
if [ ! -f /var/www/html/wp-config.php ]; then
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar; 
	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html;
	wp core download --allow-root;
	mv /var/www/wp-config.php /var/www/html/
	
	# Replace database credentials with environment variables
    sed -i "s/replace_with_env_user/${DB_USER}/" /var/www/html/wp-config.php
    sed -i "s/replace_with_env_password/${DB_PASSWORD}/" /var/www/html/wp-config.php
	sed -i "s/replace_with_db_name/${DATABASE_NAME}/" /var/www/html/wp-config.php


	wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
	wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};
fi

exec "$@"
