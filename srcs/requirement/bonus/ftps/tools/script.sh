#!/bin/sh

adduser --quiet --disabled-password --gecos "" $FTP_USER
echo "$FTP_USER:$FTP_PASS" | chpasswd

mkdir -p /var/run/vsftpd/empty

mkdir -p /home/$FTP_USER/ftp

chown -R $FTP_USER:$FTP_USER /home/$FTP_USER/ftp

chmod a-w /home/$FTP_USER/ftp

echo "$FTP_USER" | tee -a /etc/vsftpd.userlist

vsftpd /etc/vsftpd.conf