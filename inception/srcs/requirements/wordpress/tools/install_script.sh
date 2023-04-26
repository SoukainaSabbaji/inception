#!/bin/bash

if ! -f /var/www/html/wp-config.php ; then
  mkdir -p /var/www/html /run/php
  curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x /usr/local/bin/wp

  sed -i -e 's/^listen = .*/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

  wp core download --path=/var/www/html --allow-root --force
  wp config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost="$WP_HOST" --path=/var/www/html --allow-root --skip-check 
  wp core install --allow-root --url="$WP_URL" --title="$WP_TITLE" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PWD" --admin_email="$WP_ADMIN_EMAIL"  --path=/var/www/html --skip-email
  wp user create $WP_USER $WP_USER_EMAIL  --user_pass=$WP_USER_PWD --role=author  --path=/var/www/html --allow-root
fi

php-fpm7.3 -F
