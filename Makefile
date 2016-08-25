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
	@echo "    make build"
	@echo "    make run [OPTIONS]"
	@echo "    make exec"
	@echo "    make log"
	@echo "    make stop"
	@echo "    make purge"
	@echo

build:
	@docker build -t $(REPOSITORY) --rm .

run:
	@docker run --detach \
		--name="$(CONTAINER)" \
		--hostname="$(CONTAINER)" \
		--env "USERNAME=test" \
		--env "PASSWORD=test" \
		--env "DELAY=0" \
		$(REPOSITORY)

exec:
	@docker exec -it $(CONTAINER) /bin/bash --login

log:
	@docker logs $(CONTAINER)

stop:
	@docker stop $(CONTAINER) > /dev/null 2>&1 ||:

clean: stop
	@docker rm $(CONTAINER) > /dev/null 2>&1 ||:

purge: clean
	@docker rmi $(REPOSITORY) > /dev/null 2>&1 ||:
