#!/bin/bash
sed -i 's/bind-address/#bind-adress/' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS $DB_NAME";
mysql -u root -p -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS'" ;
mysql -u root -p -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';" ;
mysql -u root -p -e "FLUSH PRIVILEGES;"
mysql -u root -p -e "alter user 'root'@'localhost' identified by '$DB_ROOT_PASS';" ;
mysql -u root -p -e "FLUSH PRIVILEGES;"
kill `cat /var/run/mysqld/mysqld.pid`

mysqld 

# cat <<E >query
# USE mysql;
# FLUSH PRIVILEGES;
# GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' identified by '$DB_ROOT_PASS' WITH GRANT OPTION ;
# GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' identified by '$DB_ROOT_PASS' WITH GRANT OPTION ;
# SET PASSWORD FOR 'root'@'localhost'=PASSWORD('$DB_ROOT_PASS') ;
# DROP DATABASE IF EXISTS test ;
# # CREATE DATABASE wordpress;
# # FLUSH PRIVILEGES ;
# # GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' identified by '$DB_PASS' WITH GRANT OPTION ;
# # GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'localhost' identified by '$DB_PASS' WITH GRANT OPTION ;
# # SET PASSWORD FOR '$DB_USER'@'localhost'=PASSORD('$DB_PASS') ;
# # FLUSH PRIVILEGES ;
# # E

# # mysqld --user=mysql --bootstrap --datadir=/var/lib/mysql < query

# # rm -rf query

# # mysqld --user=mysql --console --skip-networking=0