FROM	debian:buster

RUN		apt-get update -y && apt-get upgrade -y
RUN		apt-get install -y mariadb-server mariadb-client

RUN		mkdir -p /var/run/mysqld \
		&& chown -R mysql:mysql /var/run/mysqld \
		&& chown 777 /var/run/mysqld

COPY	./conf/my.conf /my.cnf
COPY	./tools/.env /.env
COPY	./tools/dbscript.sh /dbscript.sh

RUN		chmod +x /dbscript.sh

EXPOSE	3306

RUN		export $(cat /.env | xargs) && /dbscript.sh

CMD		["mysqld"]
