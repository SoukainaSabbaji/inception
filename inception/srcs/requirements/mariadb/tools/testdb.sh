#!/bin/sh

MYCNF="/etc/my.cnf.d/mariadb-server.cnf"

if [ ! -d /run/mysqld ]; then
	mkdir -p /run/mysqld
	chown -R mysql /run/mysqld
fi

if [ ! -d /var/lib/mysql/mysql ]; then
	chown -R mysql:mysql /var/lib/mysql

	if ! command -v mysql_install_db &> /dev/null; then
		echo "Error: mysql_install_db command not found"
		exit 1
	fi

	if ! mysql_install_db --basedir=/usr --user=mysql --datadir=/var/lib/mysql --rpm > /dev/null; then
		echo "Error: Failed to initialize MariaDB data directory"
		exit 1
	fi
	tfile=`mktemp`
	if [ ! -f "$tfile" ]; then
		return 1
	fi

	cat << EOF > $tfile
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM	mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASS';
CREATE DATABASE wordpress;
CREATE USER '$DB_USER'@'%' IDENTIFIED by '$DB_PASS';
GRANT ALL PRIVILEGES ON wordpress.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF
	/usr/bin/mysqld --user=mysql --bootstrap < $tfile
	rm -f $tfile
fi

sed -i "s|skip-networking|# skip-networking|g" "$MYCNF"
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" "$MYCNF"
/usr/bin/mysqld --user=mysql --console


