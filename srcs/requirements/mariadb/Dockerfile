FROM        debian:buster

RUN         apt update && \
	    apt upgrade -y && \
	    apt install -y mariadb-server mariadb-client

COPY        ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY        ./tools/configure.sh /tmp/

RUN         chmod 766 /tmp/configure.sh; \
            chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE      3306

ENTRYPOINT  ["/tmp/configure.sh"]

CMD         ["mysqld"]
