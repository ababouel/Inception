FROM debian:buster

RUN apt update && apt install -y mariadb-server
COPY tools /var/www/
RUN chmod +x /var/www/script.sh

# RUN addgroup mysql mysql

# RUN mkdir /run/mysqld

# RUN chown -R mysql:mysql /run/mysqld

# RUN chown -R mysql:mysql /var/lib/mysql

# RUN mysql_install_db --user=mysql --ldata=/var/lib/mysql


ENTRYPOINT [ "/var/www/script.sh"] 