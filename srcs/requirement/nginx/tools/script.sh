#!/bin/sh
apt-get update && apt-get -y install nginx && apt-get install -y openssl;

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout\
 		/etc/ssl/private/nginx-selfsigned.key -out\
  		/etc/ssl/certs/nginx-selfsigned.crt \
  		-subj="/CN=ababouel/O=ababouel.1337.ma/C=MA/L=KHOURIBGA";