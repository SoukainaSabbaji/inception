#!/bin/bash
set -e
dotenv
mkdir -p /var/www/html /run/php
if ! command -v wp &> /dev/null; then
  curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x /usr/local/bin/wp
fi

sed -i 's/^listen = .*/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

wp core download --path=/var/www/html --allow-root
wp config create --dbname=testing --dbuser=nekoarc --dbpass=nekoarcnya --dbhost=localhost --path=/var/www/html --allow-root
wp core install --allow-root --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL"  --path=/var/www/html --skip-email
wp user create $WP_USER $WP_USER_EMAIL  --user_pass=$WP_USER_PWD --role=author  --path=/var/www/html --allow-root
bash
