FROM	debian:bullseye

RUN	apt-get update -y 
RUN	apt-get install mariadb-server -y

# RUN	mkdir -p /run/mysqld \
#	&& chown -R mysql:mysql /run/mysqld \
#	&& chmod 777 /run/mysqld
	

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY	./tools/initial_db.sql /var/www/

#RUN	chmod +x /script.sh

#CMD	[ "/script.sh" ]

RUN	service mariadb start && mysql < /var/www/initial_db.sql && rm -f /var/www/initial_db.sql;

#Command to launch mariadb 
CMD 	["mysqld"]
