FROM debian:buster
RUN apt-get update && apt-get install -y \
    wget vim curl php7.3 php7.3-fpm php7.3-mysql
COPY tools/install_script.sh /
RUN chmod +x ./install_script.sh
ENTRYPOINT service php7.3-fpm start && tail -f /dev/null
# ENTRYPOINT ["./install_script.sh"]