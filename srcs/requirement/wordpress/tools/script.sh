#!/bin/bash

sed -i '36 s/\/run\/php\/php7.3-fpm.sock/9000/' /etc/php/7.3/fpm/pool.d/www.conf
sed -i '841 s/2M/100M/' /etc/php/7.3/fpm/php.ini

if [ ! -f /var/www/html/wp-config.php ]; then

	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chown -R www-data:www-data /var/www/html/

	chmod -R 755 /var/www/html/ 

	chmod +x wp-cli.phar

	mv wp-cli.phar /usr/local/bin/wp

	cd /var/www/html/

	wp core download --allow-root

	cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
	wp --allow-root config set DB_NAME 		$DB_NAME
	wp --allow-root config set DB_USER 		$DB_USER
	wp --allow-root config set DB_PASSWORD 	$DB_PASS
	wp --allow-root config set DB_HOST 		$DB_HOST
	chmod 777 /var/www/html/wp-config.php
	# instal the wordpress
	wp core install --url=ababouel.42.fr --title="My Wordpress Site" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root
	wp user create $USER $USER_EMAIL --user_pass=$USER_PASSWORD --role='author' --allow-root

	# create second user in wordpress
	wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
	wp config set WP_CACHE 'true' --allow-root
	wp config set WP_REDIS_HOST 'redis' --allow-root
	wp config set WP_REDIS_PORT '6379' --allow-root
	wp plugin install redis-cache --allow-root --activate
	wp redis enable --allow-root
	
	#configure ftp with wordpress
	
fi


exec "$@"