#!/usr/bin/env bash

export YBA_RELEASE="2.18.0.1-b4"
export YBA_VERSION="${YBA_RELEASE%-*}"
export YBA_ENV_TYPE="demo"
export YBA_USERNAME="Super Admin"
export YBA_LOGIN="superadmin@yugabyte.com"
export YBA_PASSWORD="Password#123"
export YBA_HOSTNAME="yba.ws01.ws.apj.yugabyte.com"
export YBA_PORTAL="https://$YBA_HOSTNAME"
export YBA_API="$YBA_PORTAL/api/v1"
export GCP_SA_CREDENTIAL_KEY="gcp-sa.json"
export GCP_NETWORK="default"
export GCP_SUBNET="default"
export GCP_BACKUP_BUCKET="gs://ws01-backup"
export GCP_KEYRING_ID="ws01-keyring-id"
export GCP_CRYPTOKEY_ID="ws01-cryptokey-id"
