
user='<UserName>'
password='<Password>'
envoy_serial='<Envoy_SerilaNo>'
session_id=$(curl -X POST https://enlighten.enphaseenergy.com/login/login.json? -F "user[email]=$user" -F "user[password]=$password" | jq -r ".session_id")
web_token=$(curl -X POST https://entrez.enphaseenergy.com/tokens -H "Content-Type: application/json" -d "{\"session_id\": \"$session_id\", \"serial_num\": \"$envoy_serial\", \"username\": \"$user\"}")
