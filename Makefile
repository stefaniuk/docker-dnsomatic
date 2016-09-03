ifdef GITHUB_ACCOUNT
	OWNER := $(GITHUB_ACCOUNT)
else
	OWNER := $(USER)
endif
NAME := $(subst docker-,,$(shell basename $(shell dirname $(realpath  $(lastword $(MAKEFILE_LIST))))))
IMAGE :=  $(OWNER)/$(NAME)

all: help

help:
	@echo
	@echo "Usage:"
	@echo
	@echo "    make build|push|start|log|bash|stop|clean|prune"
	@echo

build:
	@docker build \
		--build-arg VERSION=$(shell cat VERSION) \
		--build-arg BUILD_DATE=$(shell date -u +"%Y-%m-%dT%H:%M:%SZ") \
		--build-arg VCS_REF=$(shell git rev-parse --short HEAD) \
		--build-arg VCS_URL=$(shell git config --get remote.origin.url) \
		--tag $(IMAGE):$(shell cat VERSION) \
		--rm .
	@docker tag $(IMAGE):$(shell cat VERSION) $(IMAGE):latest

push:
	@docker push $(IMAGE):$(shell cat VERSION)
	@docker push $(IMAGE):latest
	@curl --request POST "https://hooks.microbadger.com/images/stefaniuk/dnsomatic/j9tDGThNwuQbiXSAsvf8G10CBbQ="

start:
	@docker run --detach \
		--name $(NAME) \
		--hostname $(NAME) \
		--env "LAPSE=10" \
		--env "DELAY=0" \
		--env "TRIES=3" \
		$(IMAGE)

log:
	@docker logs --follow $(NAME)

bash:
	@docker exec --interactive --tty $(NAME) /bin/bash

stop:
	@docker stop $(NAME) > /dev/null 2>&1 ||:

clean: stop
	@docker rm $(NAME) > /dev/null 2>&1 ||:

prune: clean
	@docker rmi $(IMAGE):$(shell cat VERSION) > /dev/null 2>&1 ||:
	@docker rmi $(IMAGE):latest > /dev/null 2>&1 ||:
