#!/bin/bash

service mysql start
mysql_secure_installation <<EOF

y
hamid
hamid
y
y
y
y
EOF

echo "CREATE DATABASE my_database;
CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON my_database.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
FLUSH PRIVILEGES;" | tr -d '\r' | mysql -u root -p${DB_PASSWORD}

