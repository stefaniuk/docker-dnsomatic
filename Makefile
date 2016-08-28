ifdef GITHUB_ACCOUNT
	ACCOUNT := $(GITHUB_ACCOUNT)
else
	ACCOUNT := $(USER)
endif
CONTAINER := $(subst docker-,,$(shell basename $(shell dirname $(realpath  $(lastword $(MAKEFILE_LIST))))))
REPOSITORY :=  $(ACCOUNT)/$(CONTAINER)

all: help

help:
	@echo
	@echo "Usage:"
	@echo
	@echo "    make build|release|push|start|log|bash|stop|clean|purge"
	@echo

build:
	@docker build --tag $(REPOSITORY) --rm .

release: build
	@docker build --tag $(REPOSITORY):$(shell cat VERSION) --rm .

push: release
	@docker push $(REPOSITORY):$(shell cat VERSION)

start:
	@docker run --detach \
		--name $(CONTAINER) \
		--hostname $(CONTAINER) \
		--env "LAPSE=10" \
		--env "DELAY=0" \
		$(REPOSITORY)

log:
	@docker logs --follow $(CONTAINER)

bash:
	@docker exec --interactive --tty $(CONTAINER) /bin/bash

stop:
	@docker stop $(CONTAINER) > /dev/null 2>&1 ||:

clean: stop
	@docker rm $(CONTAINER) > /dev/null 2>&1 ||:

purge: clean
	@docker rmi $(REPOSITORY) > /dev/null 2>&1 ||:
