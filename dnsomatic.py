import requests, time, os
import logging, logging.config

logging.config.fileConfig('logging.conf')
log = logging.getLogger('dnsomatic')

username = os.getenv("USERNAME")
password = os.getenv("PASSWORD")
lapse = float(os.getenv("LAPSE"))
ip = ""

def setIp(text):
    global ip
    newIp = text.rsplit()[1]
    if newIp != ip:
        ip = newIp
        log.info("IP:" + newIp)

while True:
    r = requests.get('https://updates.dnsomatic.com/nic/update', auth=(username, password))
    if r.status_code != 200:
        log.error(r.headers)
        log.error(r.text)
    else:
        setIp(r.text)

    time.sleep(lapse)
