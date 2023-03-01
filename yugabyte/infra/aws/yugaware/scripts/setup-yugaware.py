#!/usr/bin/env python3
import os
from json import dumps, loads
from urllib.request import Request, urlopen
from urllib.error import URLError
from urllib.parse import urlencode
import ssl

CLOUD_CONFIG_JSON=os.getenv("CLOUD_CONFIG_JSON")
CLOUD_CONFIG = loads(CLOUD_CONFIG_JSON)


PORTAL_URL = f'https://localhost'

API_TOKEN = os.getenv("YB_API_TOKEN", None)
AUTH_TOKEN = None
CUSTOMER_ID = None
USER_ID = None
_relaxed_ssl = ssl.create_default_context()
_relaxed_ssl.check_hostname = False
_relaxed_ssl.verify_mode = ssl.CERT_NONE

def main():
  configure_env()
  setup_customer()
  authenticate()
  setup_kms_configs()
  setup_configs()
  setup_providers()

def configure_env():
  global PORTAL_URL
  if  "portal" in CLOUD_CONFIG:
    PORTAL_URL = CLOUD_CONFIG["portal"]
  else:
    PORTAL_URL = os.getenv("YB_PORTAL", "https://localhost")

# Register user or login
def setup_customer():
  global CUSTOMER_ID
  global USER_ID
  global API_TOKEN
  global AUTH_TOKEN
  if "customer" not in CLOUD_CONFIG:
    print("No customer to setup")
    return

  customer_count = api_get(f'{PORTAL_URL}/api/v1/customer_count', auth=False, check=False)
  if customer_count["count"] != 0:
    print("Skipping customer registration")
    return

  print("Registering new user")
  customer = CLOUD_CONFIG["customer"]
  req = {
    "code": customer["code"],
    "name": customer["name"],
    "email": customer["email"],
    "password": customer["password"],
    "confirmPassword": customer["password"],
    "confirmEULA": True
  }
  resp = api_post(f'{PORTAL_URL}/api/v1/register?generateApiToken=true', data=req, auth=False)
  CUSTOMER_ID = resp['customerUUID']
  USER_ID = resp['userUUID']
  API_TOKEN = resp['apiToken']
  AUTH_TOKEN = resp['authToken']


def authenticate():
  global CUSTOMER_ID
  global USER_ID
  global API_TOKEN
  global AUTH_TOKEN
  AUTH_TOKEN = None
  if API_TOKEN == None:
    customer = CLOUD_CONFIG['customer']
    req = {'email': customer["email"], 'password': customer["password"]}
    resp = api_post(f'{PORTAL_URL}/api/v1/login', data=req, auth=False,check=True)
    AUTH_TOKEN = resp['authToken']

  resp = api_get(f'{PORTAL_URL}/api/v1/session_info', auth=True)
  CUSTOMER_ID = resp['customerUUID']
  USER_ID = resp['userUUID']

  if resp['apiToken'] != None :
    API_TOKEN = resp['apiToken']

def setup_providers():
  if "providers" not in CLOUD_CONFIG:
    print("No providers to setup in cloud config")
    return

  for provider in CLOUD_CONFIG["providers"]:
    name = provider["name"]
    resp = api_get(f'{PORTAL_URL}/api/v1/customers/{CUSTOMER_ID}/providers',  params={"name" : name})
    if isinstance(resp, list) and len(resp) > 0 and resp[0]["name"] == name :
      print(f'Found Provider by name = {name}. Skipping')
      continue
    print(f'Creating provider : {name}')
    resp = api_post(f'{PORTAL_URL}/api/v1/customers/{CUSTOMER_ID}/providers', data=provider)
    taskId = resp["taskUUID"]
    resourceId = resp["resourceUUID"]
    print(f'Creation of provider is in progress task-id:{taskId}, resourceId:{resourceId}')

def setup_configs():
  if "configs" not in CLOUD_CONFIG:
    print("No configs to setup")
    return

  # Existing config hash
  resp = api_get(f'{PORTAL_URL}/api/v1/customers/{CUSTOMER_ID}/configs')
  existing_config = {}
  for config in resp:
    existing_config[f'{config["type"]}#{config["name"]}#{config["configName"]}'] = 1

  for config in CLOUD_CONFIG["configs"]:
    if f'{config["type"]}#{config["name"]}#{config["configName"]}' in existing_config:
      print(f'{config["type"]}#{config["name"]}#{config["configName"]} exists - skipping')
      continue
    resp =  api_post(f'{PORTAL_URL}/api/v1/customers/{CUSTOMER_ID}/configs', data=config)
    id = resp["configUUID"]
    print(f'Created configuration {id}->{config["configName"]}({config["type"]})')

def setup_kms_configs():
  if "kms_configs" not in CLOUD_CONFIG:
    print("No KMS configs to setup")
    return

  # Existing config hash
  resp = api_get(f'{PORTAL_URL}/api/v1/customers/{CUSTOMER_ID}/kms_configs')
  existing = {}
  for config in resp:
    existing[f'{config["metadata"]["name"]}'] = 1

  for c in CLOUD_CONFIG["kms_configs"]:
    if f'{c["config"]["name"]}' in existing:
      print(f'KMS Config {c["config"]["name"]} exists - skipping')
      continue
    type = c["type"]
    config = c["config"]
    resp=api_post(f'{PORTAL_URL}/api/v1/customers/{CUSTOMER_ID}/kms_configs/{type}', data=config)
    print(f'Creating KMS config via task id : {resp["taskUUID"]}')


def api_get(url, params={}, auth=True, check=True):
  qs = urlencode(params)
  url=f'{url}?{qs}' if qs != '' else url
  return api(url=url, auth=auth, check=check, method="GET")

def api_post(url, params=None, data=None, auth=True, check=True):
  qs = urlencode(params) if params != None else ''
  url=f'{url}?{qs}' if qs != '' else url
  url=f'{url}?{qs}' if qs != '' else url
  return api(url=url, data=data, auth=auth, check=check, method="POST")

def api(url, data=None, auth=True, check=True, method="POST"):
    global AUTH_TOKEN
    global API_TOKEN

    # Set common headers
    headers = {
      "content-type" : "application/json",
      "accept" : "application/json"
    }

    # Set authentication headers
    if auth and API_TOKEN != None:
        headers['X-AUTH-YW-API-TOKEN'] = API_TOKEN
    elif auth and AUTH_TOKEN != None:
        headers['X-AUTH-TOKEN'] = AUTH_TOKEN

    # Set body if needed
    if( method != "GET" and data != None):
      data=dumps(data).encode("utf-8")

    request = Request(url, data=data, method=method, headers=headers)
    try:
      with urlopen(request, context=_relaxed_ssl) as response:
        body = response.read()
        if check:
          assert response.status < 300, f'Failed to post data: {response.status}\n{body}\n{res.content}'
        return loads(body)
    except URLError as e:
        print(f'{method} {url}: Failed > {e.errno} : {e.reason}')
        exit(1)



if __name__ == "__main__":
  main()

