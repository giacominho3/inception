#!/bin/bash

service mysql start;

mysql -e "CREATE DATABASE IF NOT EXISTS $DATABASE;"
mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASS';"
mysql -e "GRANT ALL PRIVILEGES ON $DATABASE.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';"
mysql -e "FLUSH PRIVILEGES;"