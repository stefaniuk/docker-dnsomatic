import requests, time, os
import logging, logging.config

logging.config.fileConfig('logging.conf')
log = logging.getLogger('dnsomatic')

username = os.getenv('USERNAME')
password = os.getenv('PASSWORD')
lapse = float(os.getenv('LAPSE'))
ip = ''

while True:
    req = requests.get('https://updates.dnsomatic.com/nic/update', auth=(username, password))
    if req.status_code == 200:
        newIp = req.text.rsplit()[1]
        if newIp != ip:
            ip = newIp
            log.info('IP:' + ip)
    else:
        log.error(req.text)

    time.sleep(lapse)
