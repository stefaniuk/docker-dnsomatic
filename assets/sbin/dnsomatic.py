import os, time, requests
from datetime import datetime as dt
from pytz import timezone as tz

# log message
def log(level, msg):
    now = dt.now(tz(os.getenv('TIMEZONE')))
    datetime = now.strftime('%Y/%m/%d %H:%M:%S.%f')[:-3] + now.strftime('%z')
    print(datetime + '|dnsomatic|' + level + '|' + msg)
    return

# get environment variables
username = os.getenv('USERNAME')
password = os.getenv('PASSWORD')
lapse = int(os.getenv('LAPSE'))
delay = int(os.getenv('DELAY'))
tries = int(os.getenv('TRIES'))

# delay startup
if delay > 0:
    log('INFO', 'Started with a ' + str(delay) + '-second delay')
    time.sleep(delay)

current_ip = ''
current_tries = 0
while True:
    try:
        # get your IP address
        req = requests.get('http://myip.dnsomatic.com/')
        if req.status_code == 200:
            new_ip = req.text
            if new_ip != current_ip:

                # update DNS-O-Matic account
                req = requests.get('https://updates.dnsomatic.com/nic/update?myip=' + new_ip, auth=(username, password))
                if req.status_code != 200 or req.text.rsplit()[0] != 'good':
                    raise Exception(req.text)

                log('INFO', ('Current IP ' if current_ip == '' else 'New IP ') + new_ip)
                current_ip = new_ip
        else:
            raise Exception(req.text)
    except Exception as e:
        log('ERROR', str(e))

    # check max number of tries
    current_tries += 1
    if tries > 0 and current_tries >= tries:
        log('INFO', 'Reached number of ' + str(tries) + ' tries')
        break

    time.sleep(lapse)
