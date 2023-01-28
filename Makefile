all:
	mkdir -p /home/$(USER)/data/db_mariadb && mkdir -p /home/$(USER)/data/db_wordpress
	docker-compose -f /home/$(USER)/Desktop/inception/srcs/docker-compose.yml up --build

down:
	docker-compose -f /home/$(USER)/Desktop/inception/srcs/docker-compose.yml down

re: down
	docker-compose -f /home/$(USER)/Desktop/inception/srcs/docker-compose.yml up -d --build

exe:
	docker-compose  -f /home/$(USER)/Desktop/inception/srcs/docker-compose.yml exec $(CONTAINER) bash

clean:
	docker rm prune -f
	docker volume prune -f
	docker network prune -f
	docker image prune -f

.PHONY: all re down clean exe