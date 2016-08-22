Docker DNS-O-Matic
==================

Easily announce your new IP to the world from a Docker container!

Installation
------------

    docker run -d \
        -e USERNAME=${USERNAME} \
        -e PASSWORD=${PASSWORD} \
        -e LAPSE=300 \
        stefaniuk/dnsomatic

See
---

 * [DNS-O-Matic API](https://www.dnsomatic.com/wiki/api)
