FROM debian:buster

ENV  DB_NAME="wordpress"
ENV  DB_USER="soukaina"
ENV  DB_PASS="AR5000HM"
ENV  DB_ROOT_PASS="hamid"
# ENV  DB_ROOT_PASS="AR5000HM"

RUN apt-get update && \
    apt-get install -y mariadb-server vim

COPY tools/testdb.sh /  
RUN  service mysql start && \
    sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf ;
RUN chmod +x ./testdb.sh
RUN ./testdb.sh

# HEALTHCHECK --interval=30s --timeout=10s \
# CMD mysqladmin ping -h localhost || exit 1
# ENTRYPOINT ["./testdb.sh"]
ENTRYPOINT ["mysqld_safe", "--user=root", "--password=$DB_ROOT_PASS"]
