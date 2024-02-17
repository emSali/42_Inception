FROM	debian:bookworm

RUN	apt-get update -y && apt-get install mariadb-server -y

COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY	./tools/script.sh /usr/local/bin/

RUN	chmod +x /usr/local/bin/script.sh

ENTRYPOINT [ "/usr/local/bin/script.sh" ]

#Command to launch mariadb and enable the database to listen globally 
CMD 	["mysqld", "--bind-address=0.0.0.0"]
