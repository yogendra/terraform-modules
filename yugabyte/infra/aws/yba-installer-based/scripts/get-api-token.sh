#!/usr/bin/env bash

set -e
logfile=/tmp/tf-yba-run.log
RUNID=$$
function log(){
  echo "[$(date -Iseconds)] [$RUNID] $@" >> $logfile
}

log ---------------------------------Start--------------------------------------



eval "$(jq -r '@sh "login=\(.login) password=\(.password) api=\(.api)"')"

log Input :: api=$api login=$login password=$password

until  curl -m1 -fksSL $api/app_version &>> $logfile
do
  log "yba waiting"
  sleep 5
done

log "ready"

lreq=$(cat <<- EOM
{
  "email": "$login",
  "password": "$password"
}
EOM
)
until curl -fksSL -H Content-Type:application/json -X POST $api/login  -d "$lreq" &>> $logfile
do
  log "login waiting"
  sleep 5
done
log "login successful"

lres=$(curl \
  -k \
  -sSL \
  -H Content-Type:application/json \
  -X POST \
  $api/login  \
  -d "$lreq"
)
log "login response $lres"

cid=$(echo $lres | jq -r '.customerUUID')
uid=$(echo $lres | jq -r '.userUUID')
custapi=$api/customers/$custid
authtoken=$(echo $lres | jq -r '.authToken')

sres=$(curl \
  -k \
  -sSL \
  -H "X-AUTH-TOKEN: $authtoken" \
  -H Content-Type:application/json \
  -X GET \
  $api/session_info
)

log "session info $sres"

apitoken=$(echo $sres | jq -r '.apiToken')
log -----------------------------------End--------------------------------------

jq \
  -n \
  --arg cid "$cid" \
  --arg uid "$uid" \
  --arg apitoken "$apitoken" \
  --arg api "$api" \
  --arg custapi "$custapi" \
  '{"customer-id":$cid, "user-id": $uid, "api-token": $apitoken, "api": $api, "customer-api": $custapi }'
