#!/bin/sh

mv /my.conf /etc/mysql/my.conf

mysql_install_db
/etc/init.d/mysql start

mysql_secure_installation << EOF

y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
y
n
y
y
EOF

echo	"GRANT ALL ON *.* TO '$MYSQL_ROOT_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $MYSQL_DB;
CREATE USER '$MYSQL_USER'@'wordpress.inception_net' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL ON *.* TO '$MYSQL_USER'@'wordpress.inception_net';
FLUSH PRIVILEGES;" | mysql -u root

sleep 3
/etc/init.d/mysql stop
sleep 3

