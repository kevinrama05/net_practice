NAME = inception

COMPOSE = docker-compose
COMPOSE_FILE = docker-compose.yml

all: up

up:
	$(COMPOSE) -f $(COMPOSE_FILE) up -d --build

down:
	$(COMPOSE) -f $(COMPOSE_FILE) down

start:
	$(COMPOSE) -f $(COMPOSE_FILE) start

stop:
	$(COMPOSE) -f $(COMPOSE_FILE) stop

restart: down up

logs:
	$(COMPOSE) -f $(COMPOSE_FILE) logs -f

ps:
	$(COMPOSE) -f $(COMPOSE_FILE) ps

clean:
	$(COMPOSE) -f $(COMPOSE_FILE) down -v

fclean: clean
	docker system prune -af

re: fclean up

.PHONY: all up down start stop restart logs ps clean fclean re
