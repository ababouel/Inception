FROM  debian:latest

EXPOSE 443

COPY ./tools/script.sh /tmp/script.sh
RUN chmod +x /tmp/script.sh
RUN /tmp/script.sh

COPY    ./conf/default /etc/nginx/sites-enabled/default
CMD     ["nginx", "-g", "daemon off;"]