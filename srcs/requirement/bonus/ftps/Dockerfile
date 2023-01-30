FROM debian:buster

EXPOSE 21

RUN apt-get update -y && apt-get install vsftpd -y
COPY ./conf/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/script.sh /temp/script.sh
RUN chmod +x /temp/script.sh
CMD ["/temp/script.sh"]