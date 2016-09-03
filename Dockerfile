FROM stefaniuk/python:3.6-20160903

ENV USERNAME="test" \
    PASSWORD="test" \
    LAPSE="300" \
    DELAY="120" \
    TRIES="0" \
    TIMEZONE="Europe/London"

RUN set -ex \
    \
    && pip install \
        pytz \
        requests

COPY assets/usr/local/bin/dnsomatic.py /usr/local/bin/dnsomatic.py
CMD [ "python", "-u", "/usr/local/bin/dnsomatic.py" ]

### METADATA ###################################################################

ARG VERSION
ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
LABEL \
    version=$VERSION \
    build-date=$BUILD_DATE \
    vcs-ref=$VCS_REF \
    vcs-url=$VCS_URL \
    license="MIT"
