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
	@echo "    make build|run|clean|purge"
	@echo

build:
	@docker build -t $(REPOSITORY) --rm .

run:
	@docker run \
		--name="$(CONTAINER)" \
		--hostname="$(CONTAINER)" \
		--env "USERNAME=test" \
		--env "PASSWORD=test" \
		--env "LAPSE=10" \
		--env "DELAY=0" \
		$(REPOSITORY)

clean:
	@docker rm $(CONTAINER) > /dev/null 2>&1 ||:

purge: clean
	@docker rmi $(REPOSITORY) > /dev/null 2>&1 ||:
