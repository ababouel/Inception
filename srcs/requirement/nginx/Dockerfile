FROM  alpine:latest

EXPOSE 443
RUN apk update &&\
	apk upgrade &&\
	apk	add nginx openssl;

COPY	./conf/default.conf	/etc/nginx/http.d/default.conf

COPY	./tools/script.sh /tmp/script.sh

RUN		chmod +x /tmp/script.sh && /tmp/script.sh ;

CMD ["nginx", "-g", "daemon off;"]