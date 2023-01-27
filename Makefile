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

# PATH=srcs/docker-compose.yml 
# COMPOSE=docker-compose -f $(PATH)

# all: up

# up:
# 	$(COMPOSE) up

# upd:
# 	$(COMPOSE) up -d

# build:
# 	$(COMPOSE) build

# down:
# 	$(COMPOSE) down

# ps: 
# 	$(COMPOSE) ps

# re: down  build  up

# exe:
# 	$(COMPOSE) exec $(CONTAINER) bash

# clean:
# 	docker container prune -f
# 	docker volume prune -f
# 	docker network prune -f

# fclean: clean
# 	docker image prune -f

# .PHONY: down up build ps clean fclean all upd re exe 
