NAME:=pocket2notes

RUNNING:=$(shell docker ps | grep $(NAME) | cut -f 1 -d ' ')
ALL:=$(shell docker ps -a | grep $(NAME) | cut -f 1 -d ' ')
DOCKER_RUN_COMMON=--name="$(NAME)" -td $(NAME):latest

all: build

build: clean
	docker build -t=$(NAME) .

run: clean
	docker run $(DOCKER_RUN_COMMON)

# Removes existing containers.
clean:
ifneq ($(strip $(RUNNING)),)
	docker stop $(RUNNING)
endif
ifneq ($(strip $(ALL)),)
	docker rm $(ALL)
endif
