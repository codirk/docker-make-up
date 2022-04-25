SHELL := /bin/bash

COMPOSE_FILE := $(shell find ./docker-compose.d -type f |paste -sd ":" -)

up: down
	# @echo $(COMPOSE_FILE)
	COMPOSE_FILE=$(COMPOSE_FILE) docker-compose up
down:
	# @echo $(COMPOSE_FILE)
	COMPOSE_FILE=$(COMPOSE_FILE) docker-compose down

config:
	# @echo $(COMPOSE_FILE)
	COMPOSE_FILE=$(COMPOSE_FILE) docker-compose config

system.prune:
	@echo "docker system prune -a"
	docker system prune -a

docker.rm.volumes:
	docker volume rm $(shell docker volume ls -q)

docker.rm.container:
	docker rm $(shell docker ps -a -q)

docker.rm.images:
	docker rmi $(shell docker images -q)


.PHONY: up
