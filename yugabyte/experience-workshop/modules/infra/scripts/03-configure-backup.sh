#!/usr/bin/env bash

set -Eeuo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source $SCRIPT_DIR/00-env.sh
source $SCRIPT_DIR/00-yba-env.sh


YBA_REQ=$(cat <<-EOM
{
  "type" : "STORAGE",
  "configName": "gcs",
  "name" : "GCS",
  "data" : {
    "BACKUP_LOCATION": "$GCP_BACKUP_BUCKET",
    "GCS_CREDENTIALS_JSON": $(cat $SCRIPT_DIR/$GCP_SA_CREDENTIAL_KEY | jq 'tojson')
  }
}
EOM
)
curl \
  -k \
  -sSL \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'Content-Type: application/json;charset=UTF-8' \
  -H "X-AUTH-YW-API-TOKEN: $YBA_API_TOKEN" \
  "$YBA_CUSTOMER_API/configs" \
  -X POST \
  -d "$YBA_REQ"
