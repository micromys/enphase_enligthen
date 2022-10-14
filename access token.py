import json
import requests

user='<UserName>'
password='<Password>'
envoy_serial='<Envoy_SerilaNo>'

data = {'user[email]': user, 'user[password]': password}
response = requests.post('https://enlighten.enphaseenergy.com/login/login.json?', data=data)
response_data = json.loads(response.text)

data = {'session_id': response_data['session_id'], 'serial_num': envoy_serial, 'username': user}
response = requests.post('https://entrez.enphaseenergy.com/tokens', json=data)
token_raw = response.text
