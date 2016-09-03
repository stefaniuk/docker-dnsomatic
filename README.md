[![Circle CI](https://circleci.com/gh/stefaniuk/docker-dnsomatic.svg?style=shield "CircleCI")](https://circleci.com/gh/stefaniuk/docker-dnsomatic)&nbsp;[![Size](https://images.microbadger.com/badges/image/stefaniuk/dnsomatic.svg)](http://microbadger.com/images/stefaniuk/dnsomatic)&nbsp;[![Version](https://images.microbadger.com/badges/version/stefaniuk/dnsomatic.svg)](http://microbadger.com/images/stefaniuk/dnsomatic)&nbsp;[![Commit](https://images.microbadger.com/badges/commit/stefaniuk/dnsomatic.svg)](http://microbadger.com/images/stefaniuk/dnsomatic)&nbsp;[![Docker Hub](https://img.shields.io/docker/pulls/stefaniuk/dnsomatic.svg)](https://hub.docker.com/r/stefaniuk/dnsomatic/)

Docker DNS-O-Matic
==================

Easily announce your new IP to the world.

Installation
------------

Builds of the image are available on [Docker Hub](https://hub.docker.com/r/stefaniuk/dnsomatic/) where you can download from the latest stable image.

    docker pull stefaniuk/dnsomatic:latest

Alternatively you can build the image yourself.

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

See
---

- [DNS-O-Matic API](https://www.dnsomatic.com/wiki/api)
