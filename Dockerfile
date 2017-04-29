FROM codeworksio/python:3.6-20170428

ENV DNSOMATIC_USERNAME="test" \
    DNSOMATIC_PASSWORD="test" \
    DNSOMATIC_LAPSE="300" \
    DNSOMATIC_DELAY="120" \
    DNSOMATIC_TRIES="0" \
    DNSOMATIC_TIMEZONE="Europe/London"

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
