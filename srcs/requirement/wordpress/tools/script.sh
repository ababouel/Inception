#! /bin/sh
apt-get update && apt-get upgrade
apt-get add bash
apt-get add php81 php81-fpm php81-opcache
apt-get add php81-gd php81-zlib php81-curl
apt-get add tar wget
/etc/init.d/php-fpm81 restart
cd /tmp && wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp --info
wp core download
mkdir -p /var/www/html/ababouel.42.fr/public_html
chown -R www-data:www-data /var/www/html/ababouel.42.fr/public_html
chown www-data:www-data /var/www/html/example.com/public_html
cd /var/www/html/ababouel.42.fr/public_html
-u www-data wp core download
-u www-data wp core config --dbname='wordpress' --dbuser='wpuser' --dbpass='password' --dbhost='localhost' --dbprefix='wp_'
-u www-data wp core install --url='http://ababouel.42.fr' --title='Blog 1337' --admin_user='adminuser' --admin_password='password' --admin_email='ababouel@student.1337.ma'