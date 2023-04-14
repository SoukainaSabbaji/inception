FROM debian:buster
RUN apt-get update && apt-get install -y \
    wget vim curl php7.3 php7.3-fpm php7.3-mysql
COPY tools/install_script.sh /
ENV dotenv_config_path=../../.env
RUN chmod +x ./install_script.sh
ENTRYPOINT ["./install_script.sh"]