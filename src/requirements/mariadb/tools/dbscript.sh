#!/bin/sh

mv /my.cnf /etc/mysql/my.cnf

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

echo "GRANT ALL ON *.* TO '$MYSQL_ROOT_USER'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER '$MYSQL_USER'@'wordpress.src_inception_net' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL ON *.* TO '$MYSQL_USER'@'wordpress.src_inception_net';
FLUSH PRIVILEGES;" | mysql -u root

sleep 5
/etc/init.d/mysql stop
sleep 5

