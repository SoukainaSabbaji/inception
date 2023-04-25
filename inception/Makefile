
NAME = inception

USER = $(shell whoami)
all:
	@mkdir -p /home/$(USER)/wordpress/wp-content
	@mkdir -p /home/$(USER)/wordpress/db-data
	@docker-compose --env-file  srcs/.env -f srcs/docker-compose.yml up -d --build

down:
	@docker-compose --env-file  srcs/.env -f srcs/docker-compose.yml down

fclean: down
	@docker system prune -a -f
	@docker volume prune -f
	@docker network prune -f
	@docker image prune -f
	@sudo rm -rf /home/$(USER)/wordpress/wp-content
	@sudo rm -rf /home/$(USER)/wordpress/db-data

re: fclean all