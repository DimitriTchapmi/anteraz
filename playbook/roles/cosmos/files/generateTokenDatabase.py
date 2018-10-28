#!/usr/bin/python

import hmac
import hashlib
import base64
from datetime import datetime
import urllib
import sys

key = sys.argv[1]

now = datetime.utcnow().strftime('%a, %d %b %Y %H:%M:00 GMT')
payload = ('post\ndbs\n\n' + now + '\n\n').lower()
payload = bytes(payload).encode('utf-8')
key = base64.b64decode(key.encode('utf-8'))
signature = base64.b64encode(hmac.new(key, msg = payload, digestmod = hashlib.sha256).digest()).decode()
authStr = urllib.quote('type=master&ver=1.0&sig={}'.format(signature))
print authStr+";"+(now).lower()
