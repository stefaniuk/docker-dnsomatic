import requests, time, os
import logging, logging.config

# get environment variables
url = os.getenv('URL')
username = os.getenv('USERNAME')
password = os.getenv('PASSWORD')
lapse = int(os.getenv('LAPSE'))
delay = int(os.getenv('DELAY'))
timezone = os.getenv('TIMEZONE')

# set timezone
os.environ['TZ'] = timezone
time.tzset()
# set logger
logging.config.fileConfig('logging.conf')
log = logging.getLogger('dnsomatic')

# delayed startup
if delay > 1:
    log.info('Script started with a ' + str(delay) + '-second delay')
    time.sleep(delay)

ip = ''
while True:
    try:
        req = requests.get(url, auth=(username, password))
        if req.status_code == 200:
            newIp = req.text.rsplit()[1]
            if newIp != ip:
                ip = newIp
                log.info('New IP set to ' + ip)
        else:
            log.error(req.text)
    except Exception as e:
        log.error(str(e))
    time.sleep(lapse)
