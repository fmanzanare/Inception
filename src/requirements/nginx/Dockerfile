FROM debian:buster

RUN		apt-get update -y && apt-get upgrade -y
RUN		apt-get install -y nginx openssl

RUN		mkdir /etc/nginx/ssl
RUN		openssl req -newkey rsa:4096 -x509 -sha256 -days 365 \
			-nodes -out /etc/nginx/ssl/fmanzana.crt \
			-keyout /etc/nginx/ssl/fmanzana.key \
			-subj "/C=ES/ST=Andalusia/L=Malaga/O=42 School/OU=fmanzana/CN=fmanzana.42.fr"

COPY	./conf/nginx.conf /etc/nginx/conf.d

EXPOSE	443

CMD		["nginx", "-g", "daemon off;"]
