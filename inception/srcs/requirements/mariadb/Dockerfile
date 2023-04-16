FROM debian:buster
RUN apt-get update && \
    apt-get install -y mariadb-server vim

COPY ./tools/testdb.sql /  
RUN  service mysql start && \
    sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf && \
    mysql < /testdb.sql

ENTRYPOINT ["mysqld_safe"]
