FROM alpine:3.17.1

RUN apk add --no-cache --update  vsftpd==3.0.5-r2

RUN useradd -m ftpuser && echo "ftpuser:password" | chpasswd

COPY vsftpd.conf /etc/vsftpd.conf

EXPOSE 21

CMD ["vsftpd", "/etc/vsftpd.conf"]