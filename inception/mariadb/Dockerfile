FROM debian:11 
RUN apt-get update && \
    apt-get install -y mariadb-server
EXPOSE 3306
CMD [ "/usr/bin/mysqld_safe" ]