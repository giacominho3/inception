FROM debian:buster

RUN apt update && apt upgrade -y && \
    apt install nginx -y

RUN apt install vim -y
RUN apt install curl -y

RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=IT/ST=RM/L=Roma/O=42/OU=42/CN=gifulvi.42.fr/UID=gifulvi"

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]