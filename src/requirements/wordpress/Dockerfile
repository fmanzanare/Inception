FROM	debian:buster

RUN		apt-get update -y && apt-get upgrade -y
RUN		apt-get install -y curl php7.3-fpm php7.3-mysql php7.3-xml php7.3-curl php7.3-mbstring php7.3-zip

COPY	./conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
COPY	./tools/create-wp.sh /create-wp.sh
RUN		chmod +x /create-wp.sh

RUN		useradd userwp && groupadd groupwp && usermod -aG groupwp userwp

EXPOSE	9000

CMD		["/create-wp.sh"]
