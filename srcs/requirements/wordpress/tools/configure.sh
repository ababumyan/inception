#!/bin/bash

wp_config=./wordpress/wp-config.php;

sleep 10;

sed -i "s/MYSQL_DATABASE/$MYSQL_DATABASE/g"	$wp_config;
sed -i "s/MYSQL_USER/$MYSQL_USER/g"  	  	$wp_config;
sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" 	$wp_config;
sed -i "s/MYSQL_HOSTNAME/$MYSQL_HOSTNAME/g" 	$wp_config;

wp core install --allow-root --path=./wordpress/ \
	--url=$DOMAIN_NAME \
	--title=$WP_TITLE \
	--admin_user=$WP_ADMIN_NAME \
	--admin_password=$WP_ADMIN_PASSWORD \
	--admin_email=$WP_ADMIN_EMAIL;

wp user create --allow-root --path=./wordpress/ \
	$WP_USER_NAME \
	$WP_USER_EMAIL \
	--user_pass=$WP_USER_PASSWORD;

wp theme activate twentytwentytwo --allow-root --path=./wordpress/;

exec "$@";
