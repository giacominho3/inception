FROM debian:buster

RUN apt update && apt upgrade -y && \
    apt install wget -y &&\
    apt install -y php7.3 php-fpm php-mysql mariadb-client vim curl

RUN wget https://it.wordpress.org/wordpress-6.0-it_IT.tar.gz -P /var/www
RUN cd /var/www && tar -xzvf wordpress-6.0-it_IT.tar.gz && rm wordpress-6.0-it_IT.tar.gz

RUN chown -R root:root /var/www/wordpress

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
COPY ./conf/wp-config.php /var/www/wordpress/wp-config.php

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod 775 wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/wpsetup.sh /
RUN chmod 775 wpsetup.sh

# RUN sh wpsetup.sh
CMD [ "sh", "wpsetup.sh" ]