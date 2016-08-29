FROM stefaniuk/python:3.6-20160829

ENV USERNAME="test" \
    PASSWORD="test" \
    LAPSE="300" \
    DELAY="120" \
    TRIES="0" \
    TIMEZONE="Europe/London"

RUN set -ex \
    && pip install \
        pytz \
        requests

COPY assets/usr/local/bin/dnsomatic.py /usr/local/bin/dnsomatic.py
CMD [ "python", "-u", "/usr/local/bin/dnsomatic.py" ]
