#!/bin/bash

nginx=/etc/nginx/conf.d/default.conf;

sed -i "s=CERTIFICATE_PEM=$CERTIFICATE_PEM=g"		$nginx;
sed -i "s=CERTIFICATE_KEY=$CERTIFICATE_KEY=g"		$nginx;
sed -i "s=DOMAIN_NAME=$DOMAIN_NAME=g"			$nginx;
sed -i "s=WORDPRESS_HOSTNAME=$WORDPRESS_HOSTNAME=g"	$nginx;

exec "$@";
