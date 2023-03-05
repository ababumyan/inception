FILE		= -f ./srcs/docker-compose.yml
MOUNT_DIR	= $(HOME)/data

all:		build up

build:
			docker-compose $(FILE) build

up:
			mkdir -p $(MOUNT_DIR)/mariadb
			mkdir -p $(MOUNT_DIR)/wordpress
			docker-compose $(FILE) up -d

down:
			docker-compose $(FILE) down

start:
			docker-compose $(FILE) start

stop:
			docker-compose $(FILE) stop

clean:		down
			docker image prune
			docker rmi mariadb wordpress nginx
			docker volume rm srcs_mariadb_data srcs_wordpress_data
			sudo rm -rf $(MOUNT_DIR)/mariadb
			sudo rm -rf $(MOUNT_DIR)/wordpress

ls:
			docker ps

re:			clean all

.PHONY:		all clean fclean re build up down start stop ls
