all:
	mkdir -p /home/$(USER)/data/db_mariadb && mkdir -p /home/$(USER)/data/db_wordpress
	docker-compose -f ./srcs/docker-compose.yml up --build -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

re: down
	docker-compose -f ./srcs/docker-compose.yml up -d --build

exe:
	docker-compose  -f ./srcs/docker-compose.yml exec $(CONTAINER) bash

clean:
	docker rm prune -f
	docker volume prune -f
	docker network prune -f
	docker image prune -f
fclean: down  clean
	sudo rm -rf /home/ababouel/data/db_mariadb/*
	sudo rm -rf /home/ababouel/data/db_wordpress/*

.PHONY: all re down clean exe