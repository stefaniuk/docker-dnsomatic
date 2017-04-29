FROM codeworksio/python:3.6-20170428

ENV DNSOMATIC_USERNAME="username" \
    DNSOMATIC_PASSWORD="password" \
    DNSOMATIC_DELAY="60" \
    DNSOMATIC_INTERVAL="60" \
    DNSOMATIC_TRIES="0"

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
