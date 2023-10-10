FROM	debian:buster

RUN		apt-get update -y && apt-get upgrade -y
RUN		apt-get install -y mariadb-server mariadb-client

RUN		mkdir -p /var/run/mysqld \
		&& chown -R mysql:mysql /var/run/mysqld \
		&& chmod 777 /var/run/mysqld

EXPOSE	3306

COPY	./conf/my.conf /my.conf
COPY	./tools/.env /.env
COPY	./tools/dbscript.sh /dbscript.sh

RUN		export $(cat ./env | xargs) && /dbscript.sh

CMD		["mysql"]
