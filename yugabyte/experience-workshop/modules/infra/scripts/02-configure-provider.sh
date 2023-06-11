#!/usr/bin/env bash

set -Eeuo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source $SCRIPT_DIR/00-env.sh
source $SCRIPT_DIR/00-yba-env.sh

JQ_QUERY='["asia-east1", "asia-east2", "asia-northeast1", "asia-northeast2", "asia-northeast3", "asia-south1", "asia-south2", "asia-southeast1", "asia-southeast2", "australia-southeast1", "australia-southeast2", "europe-central2", "europe-north1", "europe-west1", "europe-west2", "europe-west3", "europe-west4", "europe-west6", "northamerica-northeast1", "northamerica-northeast2", "southamerica-east1", "us-central1", "us-east1", "us-east4", "us-west1", "us-west2", "us-west3", "us-west4"] as $allowed |
[
  .[]|
  select( .name as $in | $allowed | index($in) ) |
  {
    code : .name,
    details : {
      cloudInfo : {
        gcp : {}
      }
    },
    zones : [
      .zones[]|
      split("/")[-1] |
      {
        code : . ,
        name : . ,
        subnet: $gcp_subnet
      }
    ]
  }
]'
YBA_PROV_REGIONS=$(gcloud compute regions list --format="json" | jq --arg gcp_subnet "default" "$JQ_QUERY" )

YBA_PROV_REQ=$(cat <<-EOM |  jq -c
{
  "code": "gcp",
  "name": "gcp",
  "details": {
    "airGapInstall": false,
    "cloudInfo": {
      "gcp": {
        "useHostVPC": true,
        "useHostCredentials": true
      }
    },
    "ntpServers": [],
    "setUpChrony": true,
    "sshPort": 22
  },
  "regions": $YBA_PROV_REGIONS
}
EOM
)


curl \
  -k \
  -sSL \
  -H 'Accept: application/json, text/plain, */*' \
  -H 'Content-Type: application/json;charset=UTF-8' \
  -H "X-AUTH-YW-API-TOKEN: $YBA_API_TOKEN" \
  -X POST \
  "$YBA_CUSTOMER_API/providers?validate=false" \
  -d "$YBA_PROV_REQ"
