[![CircleCI](https://circleci.com/gh/stefaniuk/docker-dnsomatic.svg?style=shield "CircleCI")](https://circleci.com/gh/stefaniuk/docker-dnsomatic) [![Quay](https://quay.io/repository/stefaniuk/dnsomatic/status "Quay")](https://quay.io/repository/stefaniuk/dnsomatic)

Docker DNS-O-Matic
==================

Easily announce your new IP to the world.

Installation
------------

Automated builds are configured on [Docker Hub](https://hub.docker.com/r/stefaniuk/dnsomatic/) where you can download from the latest stable image.

    docker pull stefaniuk/dnsomatic

Alternatively, you can build the image yourself.

    docker build --tag stefaniuk/dnsomatic \
        github.com/stefaniuk/docker-dnsomatic

Quickstart
----------

Start container using:

    docker run --detach --restart always \
        --name dnsomatic \
        --hostname dnsomatic \
        --env "USERNAME=${USERNAME}" \
        --env "PASSWORD=${PASSWORD}" \
        stefaniuk/dnsomatic

Should you need to log in into the container you have just created use the following command:

    docker exec --interactive --tty dnsomatic \
        /bin/bash

See
---

- [DNS-O-Matic API](https://www.dnsomatic.com/wiki/api)
