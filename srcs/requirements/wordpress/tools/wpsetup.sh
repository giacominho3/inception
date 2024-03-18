#!/bin/bash

while ! mysql -h${MY_DATABASE} -u${DB_USER} -p${DB_PASS} ${MYSQL_WP_DB} -e ";" &> /dev/null; do
	echo "waiting for mariadb..."
	sleep 3
done

cd /var/www/html

if [ ! -f "/var/www/html/index.html" ]; then
	echo "[WP Container] It seems that wp-cli isn't installed, installing it right now..."

	echo "nameserver 8.8.8.8" >> /etc/resolv.conf
	echo "nameserver 8.8.4.4" >> /etc/resolv.conf

	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	php wp-cli.phar --info

	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wp cli update

	wp core download --allow-root
	echo "[WP Container] wp-cli installed and updated!"

	wp config create \
		--dbname=${MYSQL_WP_DB} \
		--dbuser=${DB_USER} \
		--dbpass=${DB_PASS} \
		--dbhost=mariadb:3306 \
		--dbcollate="utf8_general_ci" \
		--allow-root
	
	wp core install \
		--url=${SERVER_NAME} \
		--title=${WP_TITLE} \
		--admin_user=${WP_ADMIN_USER} \
		--admin_password=${WP_ADMIN_PASS} \
		--admin_email=${WP_ADMIN_EMAIL} \
		--skip-email \
		--allow-root

	wp user create ${WP_USER} ${WP_EMAIL} \
		--role=subscriber \
		--user_pass=${WP_PASS} \
		--allow-root

fi

sed "s/127.0.0.1:9000/0.0.0.0:9000/1" -i -r /etc/php81/php-fpm.d/www.conf

echo "[WP Contaier] starting php-fpm"
/usr/sbin/php-fpm81 -F -R
