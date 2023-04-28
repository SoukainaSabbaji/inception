FROM alpine:3.15

RUN apk update && apk upgrade &&\
    apk add mariadb mariadb-client procps && \
    rm -rf /var/cache/apk/*

COPY tools/testdb.sh /tmp/testdb.sh

ENTRYPOINT [ "sh", "/tmp/testdb.sh" ]