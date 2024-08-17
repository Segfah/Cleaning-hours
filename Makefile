# Makefile

# Variables
DOCKER_COMPOSE = docker compose
DOCKER_CLEAN_CONTAINERS = docker rm -f $$(docker ps -aq)
DOCKER_CLEAN_IMAGES = docker rmi -f $$(docker images -q)  # -f (force) to ensure removal of images

# Targets
.PHONY: run clean fclean

# Build and start containers in detached mode
all:
	$(DOCKER_COMPOSE) up --build

all:
	$(DOCKER_COMPOSE) up --build -d

# Stop and remove containers, networks, and volumes defined in docker-compose.yml
clean:
	$(DOCKER_COMPOSE) down

# Combination of clean, remove all containers, remove all images
fclean: clean
	$(DOCKER_CLEAN_CONTAINERS)
	$(DOCKER_CLEAN_IMAGES)
