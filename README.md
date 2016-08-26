Docker DNS-O-Matic
==================

Easily announce your new IP to the world.

Installation
------------

    git clone https://github.com/stefaniuk/docker-dnsomatic.git
    cd docker-dnsomatic
    docker build -t stefaniuk/dnsomatic --rm .

Quickstart
----------

    docker run -d \
        --name "dnsomatic" \
        --hostname "dnsomatic" \
        --env "USERNAME=${USERNAME}" \
        --env "PASSWORD=${PASSWORD}" \
        stefaniuk/dnsomatic

Todo
----

 * Convert Python code to Shell script
 * Include timezone in the log output

See
---

 * [DNS-O-Matic API](https://www.dnsomatic.com/wiki/api)
