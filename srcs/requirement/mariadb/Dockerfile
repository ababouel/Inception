FROM debian:buster

RUN apt update && apt install -y mariadb-server
COPY tools /var/www/
RUN chmod +x /var/www/script.sh
ENTRYPOINT [ "/var/www/script.sh"] 