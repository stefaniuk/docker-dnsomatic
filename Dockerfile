FROM stefaniuk/python:3.6-20160828

ENV USERNAME="test" \
    PASSWORD="test" \
    LAPSE="300" \
    DELAY="120" \
    TIMEZONE="Europe/London"

RUN pip install \
    pytz \
    requests

COPY assets/sbin/dnsomatic.py /sbin/dnsomatic.py
CMD [ "-u", "/sbin/dnsomatic.py" ]
