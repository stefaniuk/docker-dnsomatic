FROM python:3-onbuild

ENV URL ${URL:-"https://updates.dnsomatic.com/nic/update"}
ENV USERNAME ${USERNAME:-"test"}
ENV PASSWORD ${PASSWORD:-"test"}
ENV LAPSE ${LAPSE:-"300"}
ENV DELAY ${DELAY:-"120"}
ENV TIMEZONE ${TIMEZONE:-"Europe/London"}

COPY dnsomatic.py /
COPY logging.conf /

CMD [ "python", "dnsomatic.py" ]
