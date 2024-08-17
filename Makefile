# Makefile

# Variables
DOCKER_COMPOSE = docker compose

# Targets
.PHONY: run all clean fclean

# Build and start containers in detached mode
run:
	$(DOCKER_COMPOSE) up --build

all:
	$(DOCKER_COMPOSE) up --build -d

# Stop and remove containers, networks, and volumes defined in docker-compose.yml
clean:
	$(DOCKER_COMPOSE) down

# Combination of clean, remove all containers, remove all images
fclean: clean
	# Remove all containers
	@containers=$$(docker ps -aq) && if [ -n "$$containers" ]; then docker rm -f $$containers; fi
	# Remove all images
	@images=$$(docker images -q) && if [ -n "$$images" ]; then docker rmi -f $$images; fi
