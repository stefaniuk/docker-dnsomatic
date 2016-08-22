FROM python:3-onbuild

ENV LAPSE ${LAPSE:-"300"}

COPY dnsomatic.py /
COPY logging.conf /

CMD [ "python", "dnsomatic.py" ]
