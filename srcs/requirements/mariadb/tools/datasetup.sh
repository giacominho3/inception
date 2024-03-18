echo "[Inception-MariaDB] Initializing the database"

mysql_install_db --user=root

mysql_upgrade

mysqld --bind-address=127.0.0.1 --user=root --datadir=/data --skip-networking=0 &
SQL_PID=$!

sleep 5

echo "[MariaDB Container]Creating user"
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" | mysql -u root


echo "[MariaDB Container]Creating database"
echo "CREATE DATABASE mariadb;" | mysql -u root

echo "[MariaDB Container]Granting privileges to user on the DB"
echo "GRANT ALL PRIVILEGES ON $MYSQL_WP_DB.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';" | mysql -u root

echo "FLUSH PRIVILEGES;" | mysql -u root

echo "[MariaDB Container] Restarting the database"
kill $SQL_PID
wait $SQL_PID

mysqld --bind-address=0.0.0.0 --user=root --datadir=/data --skip-networking=0

