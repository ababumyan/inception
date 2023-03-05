
FROM        debian:buster

RUN         apt update &&\
            apt upgrade -y &&\
            apt install -y wget curl; \
            apt install -y php php-fpm php-mysqli mariadb-client

WORKDIR     /var/www

RUN         wget https://wordpress.org/latest.tar.gz; \
            tar -xzvf latest.tar.gz; \
            rm -rf latest.tar.gz; \
            mkdir -p /run/php;

COPY	    ./tools/configure.sh ./

COPY	    ./conf/wp-config.php ./wordpress/

COPY	    ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN         curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
            chmod +x wp-cli.phar; \
            mv wp-cli.phar /usr/local/bin/wp

RUN         chmod 766 ./configure.sh;

EXPOSE      9000

ENTRYPOINT  ["/var/www/configure.sh"]

CMD         ["/usr/sbin/php-fpm7.3", "-F"]
