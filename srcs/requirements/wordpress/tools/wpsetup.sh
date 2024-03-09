#!/bin/bash

sleep 10

WP_CONFIG="/var/www/wordpress/wp-config.php"
PHP_FOLDER="/run/php"

if [ ! -f "$WP_CONFIG" ]; then
    wp config create --allow-root \
        --dbname=$MY_DATABASE \
        --dbuser=$DB_USER \
        --dbpass=$DB_PASS \
        --dbhost=mariadb:3306 --path='/var/www/wordpress'
fi

wp core download --allow-root
wp core install --url=$SERVER_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root
wp user create $WP_USER $WP_EMAIL --role=author --user_pass=$WP_PASS --allow-root
wp theme install astra --activate --allow-root

if [ -d "$PHP_FOLDER" ]; then
    mkdir -p /run/php
fi

/usr/sbin/php-fpm7.3 -F