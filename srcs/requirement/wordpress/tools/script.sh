#! /bin/sh
apt-get update && apt-get upgrade
apt-get add bash
apt-get add php81 php81-fpm php81-opcache
apt-get add php81-gd php81-zlib php81-curl
apt-get add tar wget
/etc/init.d/php-fpm81 restart
cd /tmp && wget wget https://wordpress.org/latest.tar.gz
