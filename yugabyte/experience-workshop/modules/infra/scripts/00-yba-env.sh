#!/usr/bin/env bash
until  curl -fksSL $YBA_API/app_version &>/dev/null
do
  sleep 5
done

YBA_LOGIN_REQ=$(cat <<- EOM
{
  "email": "$YBA_LOGIN",
  "password": "$YBA_PASSWORD"
}
EOM
)
YBA_LOGIN_RES=$(
  curl \
    -k \
    -sSL \
    -H Content-Type:application/json \
    -X POST \
    $YBA_API/login  \
    -d "$YBA_LOGIN_REQ"
)

YBA_AUTH_TOKEN=$(echo $YBA_LOGIN_RES | jq -r '.authToken')

YBA_SESSION_INFO_RES=$(
curl \
  -k \
  -sSL \
  -H "X-AUTH-TOKEN: $YBA_AUTH_TOKEN" \
  -H Content-Type:application/json \
  -X GET \
  $YBA_API/session_info
)

export YBA_CUST_ID=$(echo $YBA_LOGIN_RES | jq -r '.customerUUID')
export YBA_USER_ID=$(echo $YBA_LOGIN_RES | jq -r '.userUUID')
export YBA_CUSTOMER_API=$YBA_API/customers/$YBA_CUST_ID
export YBA_API_TOKEN=$(echo $YBA_SESSION_INFO_RES | jq -r '.apiToken')
