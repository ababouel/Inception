FROM debian:latest

EXPOSE	9000
COPY	./tools/script.sh /tmp/script.sh
RUN		chmod +x /tmp/script.sh && /tmp/script.sh;
WORKDIR /var/www/localhost/htdocs
COPY	./tools/test.php .