Docker DNS-O-Matic
==================

Easily announce your new IP to the world.

Installation
------------

Automated builds of the image are available on [Docker Hub](https://hub.docker.com/r/stefaniuk/dnsomatic/).

    docker pull stefaniuk/dnsomatic:latest

Alternatively you can build the image yourself.

    docker build --tag stefaniuk/dnsomatic \
        github.com/stefaniuk/docker-dnsomatic

Quickstart
----------

Start container using:

    docker run --detach --restart always \
        --name "dnsomatic" \
        --hostname "dnsomatic" \
        --env "USERNAME=${USERNAME}" \
        --env "PASSWORD=${PASSWORD}" \
        stefaniuk/dnsomatic

Log in to it using:

    docker exec -it dnsomatic /bin/bash

See
---

 * [DNS-O-Matic API](https://www.dnsomatic.com/wiki/api)
