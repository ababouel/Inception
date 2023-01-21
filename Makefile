PATH=srcs/docker-compose.yml 
COMPOSE=docker-compose -f $(PATH)

all: up

up:
	$(COMPOSE) up

upd:
	$(COMPOSE) up -d

build:
	$(COMPOSE) build

down:
	$(COMPOSE) down

ps: 
	$(COMPOSE) ps

re: down  build  up

exe:
	$(COMPOSE) exec $(CONTAINER) bash

clean:
	docker container prune -f
	docker volume prune -f
	docker network prune -f

fclean: clean
	docker image prune -f

.PHONY: down up build ps clean fclean all upd re exe 
