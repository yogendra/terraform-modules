#!/usr/bin/env bash

set -Eeuo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source $SCRIPT_DIR/00-env.sh
source $SCRIPT_DIR/00-yba-env.sh

YBA_REQ=$(cat <<-EOM
{
  "name": "gcp-kms",
  "GCP_CONFIG": $(cat $SCRIPT_DIR/$GCP_SA_CREDENTIAL_KEY | jq ),
  "LOCATION_ID": "global",
  "PROTECTION_LEVEL": "HSM",
  "KEY_RING_ID": "$GCP_KEYRING_ID",
  "CRYPTO_KEY_ID": "$GCP_CRYPTOKEY_ID"
}
EOM
)
curl \
  -k \
  -sSL \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'Content-Type: application/json;charset=UTF-8' \
  -H "X-AUTH-YW-API-TOKEN: $YBA_API_TOKEN" \
  "$YBA_CUSTOMER_API/kms_configs/GCP" \
  -X POST \
  -d "$YBA_REQ"
