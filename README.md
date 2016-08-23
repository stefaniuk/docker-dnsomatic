Docker DNS-O-Matic
==================

Easily announce your new IP to the world.

Installation
------------

    git clone https://github.com/stefaniuk/docker-dnsomatic.git
    cd docker-dnsomatic
    docker build -t stefaniuk/dnsomatic --rm .

Quick Start
-----------

    docker run -d \
        --name="dnsomatic" \
        --hostname="dnsomatic" \
        -e USERNAME=${USERNAME} \
        -e PASSWORD=${PASSWORD} \
        stefaniuk/dnsomatic

TODO
----

 * Include timezone in the log output
 * Drop `onbuild` image

See
---

 * [DNS-O-Matic API](https://www.dnsomatic.com/wiki/api)
