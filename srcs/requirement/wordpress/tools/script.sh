#! /bin/sh
apt-get update -y
apt-get upgrade -y
apt-get install  tar wget -y
apt-get install php-fpm php-common php-mysql \
php-xml php-xmlrpc php-curl php-gd \
php-imagick php-cli php-dev php-imap \
php-mbstring php-opcache php-redis \
php-soap php-zip -y
# /etc/init.d/php-fpm8.0 restart
# cd /tmp && wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
# chmod +x wp-cli.phar
# mv wp-cli.phar /usr/local/bin/wp
# wp --info
# wp core download
# mkdir -p /var/www/html/ababouel.42.fr/public_html
# chown -R www-data:www-data /var/www/html/ababouel.42.fr/public_html
# chown www-data:www-data /var/www/html/example.com/public_html
# cd /var/www/html/ababouel.42.fr/public_html
# -u www-data wp core download
# -u www-data wp core config --dbname='wordpress' --dbuser='wpuser' --dbpass='password' --dbhost='localhost' --dbprefix='wp_'
# -u www-data wp core install --url='http://ababouel.42.fr' --title='Blog 1337' --admin_user='adminuser' --admin_password='password' --admin_email='ababouel@student.1337.ma'