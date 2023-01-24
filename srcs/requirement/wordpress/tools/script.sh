#!/bin/bash
	sed -i '36 s/\/run\/php\/php7.3-fpm.sock/9000/' /etc/php/7.3/fpm/pool.d/www.conf
	sed -i '841 s/2M/100M/' /etc/php/7.3/fpm/
if ! /var/www/html/wp-config.php; then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar  
	# change the owner of the directory of /var/www/html and all subdirectories
	chown -R www-data:www-data /var/www/html/
	#changing the owner of /var/www/html/ to 755 
	chmod -R 755 /var/www/html/ 
	# is an archive that contains WP-CLI tool.
	chmod +x wp-cli.phar
	# move the wp-cli.phar to user-installed executable, so wp command-line will available system-wide.
	mv wp-cli.phar /usr/local/bin/wp
	# move to /var/www/html/ directory
	cd /var/www/html/
	# download wordpress using wp-CLI 
	wp core download --allow-root
	cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
	chmod 777 /var/www/html/wp-config.php
	wp --allow-root config set DB_NAME 		$DB_NAME
	wp --allow-root config set DB_USER 		$DB_USER
	wp --allow-root config set DB_PASSWORD 	$DB_PASS
	wp --allow-root config set DB_HOST 		$DB_HOST
	# set Hostname of redis container
	# wp config set WP_REDIS_HOST 'redis' --allow-root

	# set The Port of Redis, This command is also assuming that Redis is running and listen on port 6379,
	# wp config set WP_REDIS_PORT '6379' --allow-root

	# The instruction "wp config set WP_CACHE 'true'" is a command that sets the value of the WP_CACHE constant in the WordPress configuration file to "true".
	# This constant controls whether caching is enabled in WordPress or not.
	# wp config set WP_CACHE 'true' --allow-root

	# instal the wordpress
	if ! wp core is-installed; then
		wp core install --url="ababouel.42.fr" --title="My Wordpress Site" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root
		wp user create $USER $USER_EMAIL --user_pass=$USER_PASSWORD --role='author' --allow-root
	fi

	# create second user in wordpress

	# install redi-cache plugin
	# wp plugin install redis-cache --allow-root

	# activate the plugin of redis-cache
	# wp plugin activate redis-cache --allow-root 

	# enable the plugin of redis-cache 
	# wp redis enable --allow-root
fi
exec "$@"