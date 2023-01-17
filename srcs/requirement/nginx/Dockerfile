FROM  debian:latest

EXPOSE 443
RUN apt-get update -y &&\
	apt-get upgrade -y &&\
	apt-get	install nginx openssl -y;

# COPY	./conf/default.conf	/etc/nginx/http.d/default.conf

COPY	./tools/script.sh /tmp/script.sh

RUN		chmod +x /tmp/script.sh && /tmp/script.sh ;

CMD ["nginx", "-g", "daemon off;"]