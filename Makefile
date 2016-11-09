ifdef GITHUB_ACCOUNT
	OWNER := $(GITHUB_ACCOUNT)
else
	OWNER := $(USER)
endif
NAME := $(subst docker-,,$(shell basename $(shell dirname $(realpath  $(lastword $(MAKEFILE_LIST))))))
IMAGE :=  $(OWNER)/$(NAME)

all: help

help:
	echo
	echo "Usage:"
	echo
	echo "    make build|create|start|stop|log|bash|clean|remove|push"
	echo

build:
	docker build \
		--build-arg VERSION=$(shell cat VERSION) \
		--build-arg BUILD_DATE=$(shell date -u +"%Y-%m-%dT%H:%M:%SZ") \
		--build-arg VCS_REF=$(shell git rev-parse --short HEAD) \
		--build-arg VCS_URL=$(shell git config --get remote.origin.url) \
		--tag $(IMAGE):$(shell cat VERSION) \
		--rm .
	docker tag $(IMAGE):$(shell cat VERSION) $(IMAGE):latest

create:
	docker stop $(IMAGE) > /dev/null 2>&1 ||:
	docker rm $(IMAGE) > /dev/null 2>&1 ||:
	docker create --interactive --tty \
		--name $(NAME) \
		--hostname $(NAME) \
		--env "LAPSE=10" \
		--env "DELAY=0" \
		--env "TRIES=3" \
		$(IMAGE)

start:
	docker start $(NAME)

stop:
	docker stop $(NAME)

log:
	docker logs --follow $(NAME)

bash:
	docker exec --interactive --tty \
		$(NAME) \
		/bin/bash --login ||:

clean:
	docker stop $(NAME) > /dev/null 2>&1 ||:
	docker rm $(NAME) > /dev/null 2>&1 ||:

remove: clean
	@docker rmi $(IMAGE):$(shell cat VERSION) > /dev/null 2>&1 ||:
	@docker rmi $(IMAGE):latest > /dev/null 2>&1 ||:

push:
	docker push $(IMAGE):$(shell cat VERSION)
	docker push $(IMAGE):latest
	curl --request POST "https://hooks.microbadger.com/images/stefaniuk/dnsomatic/j9tDGThNwuQbiXSAsvf8G10CBbQ="

.SILENT:
