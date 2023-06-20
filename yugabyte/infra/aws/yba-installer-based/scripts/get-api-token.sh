#!/usr/bin/env bash

set -e

eval "$(jq -r '@sh "login=\(.login) password=\(.password) api=\(.api)"')"

until  curl -fksSL $api/app_version &>/dev/null
do
  sleep 5
done

lreq=$(cat <<- EOM
{
  "email": "$login",
  "password": "$password"
}
EOM
)
lres=$(
  curl \
    -k \
    -sSL \
    -H Content-Type:application/json \
    -X POST \
    $api/login  \
    -d "$lreq"
)
cid=$(echo $lres | jq -r '.customerUUID')
uid=$(echo $lres | jq -r '.userUUID')
custapi=$api/customers/$custid
authtoken=$(echo $lres | jq -r '.authToken')

sres=$(
curl \
  -k \
  -sSL \
  -H "X-AUTH-TOKEN: $authtoken" \
  -H Content-Type:application/json \
  -X GET \
  $api/session_info
)

apitoken=$(echo $sres | jq -r '.apiToken')

jq \
  -n \
  --arg cid "$cid" \
  --arg uid "$uid" \
  --arg apitoken "$apitoken" \
  --arg api "$api" \
  --arg custapi "$custapi" \
  '{"customer-id":$cid, "user-id": $uid, "api-token": $apitoken, "api": $api, "customer-api": $custapi }'
