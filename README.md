[![Circle CI](https://circleci.com/gh/codeworksio/docker-dnsomatic.svg?style=shield "CircleCI")](https://circleci.com/gh/codeworksio/docker-dnsomatic)&nbsp;[![Size](https://images.microbadger.com/badges/image/codeworksio/dnsomatic.svg)](http://microbadger.com/images/codeworksio/dnsomatic)&nbsp;[![Version](https://images.microbadger.com/badges/version/codeworksio/dnsomatic.svg)](http://microbadger.com/images/codeworksio/dnsomatic)&nbsp;[![Commit](https://images.microbadger.com/badges/commit/codeworksio/dnsomatic.svg)](http://microbadger.com/images/codeworksio/dnsomatic)&nbsp;[![Docker Hub](https://img.shields.io/docker/pulls/codeworksio/dnsomatic.svg)](https://hub.docker.com/r/codeworksio/dnsomatic/)

Docker DNS-O-Matic
==================

Easily announce your new IP address to the world.

Installation
------------

Builds of the image are available on [Docker Hub](https://hub.docker.com/r/codeworksio/dnsomatic/) where you can download from the latest stable image.

    docker pull codeworksio/dnsomatic

Alternatively you can build the image yourself.

    docker build --tag codeworksio/dnsomatic \
        github.com/codeworksio/docker-dnsomatic

Quickstart
----------

Start container using:

    docker run --detach --restart always \
        --name dnsomatic \
        --hostname dnsomatic \
        --env "DNSOMATIC_USERNAME=username" \
        --env "DNSOMATIC_PASSWORD=password" \
        codeworksio/dnsomatic

See
---

- [DNS-O-Matic API](https://www.dnsomatic.com/wiki/api)
