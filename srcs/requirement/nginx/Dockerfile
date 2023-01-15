FROM  alpine:latest

EXPOSE 443
RUN apk update &&\
	apk upgrade &&\
	apk	add nginx;

COPY ./conf/default.conf /etc/nginx/http.d/default.conf
CMD ["nginx", "-g", "daemon off;"]
