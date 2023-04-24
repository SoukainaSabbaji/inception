FROM alpine:latest

ARG DB_NAME
ARG DB_USER
ARG DB_PASS
ARG DB_ROOT_PASS

RUN apk update && apk upgrade &&\
    apk add mariadb mariadb-client procps && \
    rm -rf /var/cache/apk/*

RUN sed -i 's/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY database.sql /docker-entrypoint-initdb.d/

CMD ["mysqld_safe"]
