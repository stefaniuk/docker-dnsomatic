import requests, time, os
import logging, logging.config

url = os.getenv('URL')
username = os.getenv('USERNAME')
password = os.getenv('PASSWORD')
lapse = float(os.getenv('LAPSE'))
timezone = os.getenv('TIMEZONE')

os.environ['TZ'] = timezone
time.tzset()
logging.config.fileConfig('logging.conf')
log = logging.getLogger('dnsomatic')

ip = ''
while True:
    try:
        req = requests.get(url, auth=(username, password))
        if req.status_code == 200:
            newIp = req.text.rsplit()[1]
            if newIp != ip:
                ip = newIp
                log.info('New IP ' + ip)
        else:
            log.error(req.text)
    except Exception as e:
        log.error(str(e))
    time.sleep(lapse)
