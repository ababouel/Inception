FROM debian:buster

# install php and php-curl and php-mysql and php7.3-fpm and curl and sendmail
RUN apt update && apt install -y  apt-utils php php-curl php-mysql\
    && apt install -y php-fpm \
    && apt install -y curl 

# create the /run/php/ used for storing session data, temporary files, or other types of data that is generated and used by PHP while it's running
RUN mkdir -p /run/php/

COPY ./tools/script.sh /tmp/script.sh

RUN chmod +x /tmp/script.sh

RUN  /tmp/script.sh

CMD [ "php-fpm7.3", "-F" ]