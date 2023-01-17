#!/bin/sh

openssl req -x509 -nodes -days 365\
	-newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key\
	-out /etc/ssl/certs/nginx-selfsigned.crt -subj \
	"/C=MO/L=KHOURIBGA/O=1337/OU=student/CN=ababouel.42.fr";

echo "ababouel.42.fr" > /etc/hostname