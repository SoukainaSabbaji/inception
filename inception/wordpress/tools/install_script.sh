#!/bin/bash

mkdir -p /var/www/html /run/php
if ! command -v wp &> /dev/null; then
  curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x /usr/local/bin/wp
fi

wp core download --path=/var/www/html --allow-root
wp config create --dbname=testing --dbuser=nekoarc --dbpass=nekoarcnya --dbhost=localhost --path=/var/www/html --allow-root
bash
