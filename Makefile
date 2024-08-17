# Makefile

# Variables
DOCKER_COMPOSE = docker compose

# Targets
.PHONY: all drun clean fclean

# Build and start containers in detached mode
all:
	$(DOCKER_COMPOSE) up --build -d

drun:
	$(DOCKER_COMPOSE) up --build


# Stop and remove containers, networks, and volumes defined in docker-compose.yml
clean:
	$(DOCKER_COMPOSE) down

# Combination of clean, remove all containers, remove all images
fclean: clean
	@containers=$$(docker ps -aq) && if [ -n "$$containers" ]; then docker rm -f $$containers; fi
	@images=$$(docker images -q) && if [ -n "$$images" ]; then docker rmi -f $$images; fi
