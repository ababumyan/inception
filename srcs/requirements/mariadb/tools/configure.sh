#!/bin/bash


if [ ! -d "/run/mysqld" ];
then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

mkdir -p /var/lib/mysql
if [ ! -d "/var/lib/mysql/$MYSQL_DATABASE" ];
then
	mysql_install_db;

	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" > ./install.sql;

	echo -n "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* " >> ./install.sql;
	echo "TO $MYSQL_USER@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> ./install.sql;

	/usr/bin/mysqld_safe &

	sleep 3;

	mariadb < install.sql;
	mysqladmin -u root password $MYSQL_ROOT_PASSWORD;

	mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown;
fi

exec "$@";
