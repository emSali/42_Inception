FROM	debian:bookworm

RUN	apt-get update -y 
RUN	apt-get install mariadb-server -y

# RUN	mkdir -p /run/mysqld \
#	&& chown -R mysql:mysql /run/mysqld \
#	&& chmod 777 /run/mysqld
	

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY	./tools/script.sh /

RUN	chmod +x /script.sh

CMD	[ "/script.sh" ]

#Command to launch mariadb and enable the database to listen globally 
# CMD 	["mysql", "--bind-address=0.0.0.0"]
