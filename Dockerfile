FROM python:3.6-slim

ENV USERNAME ${USERNAME:-"test"}
ENV PASSWORD ${PASSWORD:-"test"}
ENV LAPSE ${LAPSE:-"300"}
ENV DELAY ${DELAY:-"120"}
ENV TIMEZONE ${TIMEZONE:-"Europe/London"}

RUN pip install requests pytz
COPY dnsomatic.py /

CMD [ "python", "-u", "dnsomatic.py" ]
