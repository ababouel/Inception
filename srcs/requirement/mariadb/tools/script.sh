#!/bin/bash
sed -i 's/127.0.0.1/0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS $DB_NAME";
mysql -u root -p -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS'" ;
mysql -u root -p -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';" ;
mysql -u root -p -e "FLUSH PRIVILEGES;"

kill `cat /var/run/mysqld/mysqld.pid`

mysqld