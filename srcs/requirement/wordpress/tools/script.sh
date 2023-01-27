#!/bin/bash
sed -i '36 s/\/run\/php\/php7.3-fpm.sock/9000/' /etc/php/7.3/fpm/pool.d/www.conf
sed -i '841 s/2M/100M/' /etc/php/7.3/fpm/php.ini
if [ ! -f /var/www/html/wp-config.php ]; then
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar  

<<<<<<< HEAD
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
=======
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

	# create wp-config.php file
	# touch wp-config.php

	# copy the default configuration to wp-config.php
	# cat /var/www/html/wp-config.php
	cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
	# change is modifying the unix socket used for the connection of PHP-FPM with the web server,
	# from the default /run/php/php7.3-fpm.sock to TCP/IP port 9000 .

	# Set The Database that will be connected with wordpress
	sed -i "s/database_name_here/$DB_NAME/g" /var/www/html/wp-config.php

	# # Set the Username of The database
	sed -i "s/username_here/$DB_USER/g" /var/www/html/wp-config.php

	# Set the Password
	sed -i "s/password_here/$DB_PASS/g" /var/www/html/wp-config.php

	# # set The Hostname of the That base
	sed -i "s/localhost/$DB_HOST/g" /var/www/html/wp-config.php

>>>>>>> e4902514396a272f721ec9a9ebca70300f116783
	# wp --allow-root core config --dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASS
	chmod 777 /var/www/html/wp-config.php
	# wp config set FORCE_SSL_ADMIN 'false' --allow-root

	# set Hostname of redis container
	wp config set WP_REDIS_HOST 'redis' --allow-root

	# set The Port of Redis, This command is also assuming that Redis is running and listen on port 6379,
	wp config set WP_REDIS_PORT '6379' --allow-root

	# The instruction "wp config set WP_CACHE 'true'" is a command that sets the value of the WP_CACHE constant in the WordPress configuration file to "true".
	# This constant controls whether caching is enabled in WordPress or not.
	wp config set WP_CACHE 'true' --allow-root

	# instal the wordpress
<<<<<<< HEAD
	wp core install --url=localhost --title="My Wordpress Site" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root
=======
	wp core install --url=ababouel.42.fr --title="My Wordpress Site" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root
>>>>>>> e4902514396a272f721ec9a9ebca70300f116783

	# create second user in wordpress
	wp user create $USER $USER_EMAIL --user_pass=$USER_PASSWORD --role='author' --allow-root

# install redi-cache plugin
<<<<<<< HEAD
	wp plugin install redis-cache --allow-root

# activate the plugin of redis-cache
	wp plugin activate redis-cache --allow-root 

# enable the plugin of redis-cache 
	wp redis enable --allow-root
=======
# wp plugin install redis-cache --allow-root

# activate the plugin of redis-cache
# wp plugin activate redis-cache --allow-root 

# enable the plugin of redis-cache 
# wp redis enable --allow-root
>>>>>>> e4902514396a272f721ec9a9ebca70300f116783
fi
exec "$@"