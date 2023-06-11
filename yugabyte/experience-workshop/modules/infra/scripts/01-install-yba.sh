#!/usr/bin/env bash

set -Eeuo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source $SCRIPT_DIR/00-env.sh

PKG_URL="https://downloads.yugabyte.com/releases/$YBA_VERSION/yba_installer_full-$YBA_RELEASE-linux-x86_64.tar.gz"

mkdir -p /opt/yugabyte /opt/yba-installer /opt/yba-ctl /opt/yugabyte/data/yba-installer/certs
curl -sSL  "${PKG_URL}" -o /opt/yba-installer.tgz
tar -C /opt/yba-installer -xf /opt/yba-installer.tgz --strip-components=1
rm -f /opt/yba-installter.tgz
/opt/yba-installer/yba-ctl preflight --force
/opt/yba-installer/yba-ctl install
chown -R yugabyte:yugabyte /opt/yugabyte /opt/yba-ctl /opt/yugabyte/data/yba-installer/certs
curl \
  -k \
  -sSL \
  -H content-type:application/json \
  $YBA_API/register?generateApiToken=true \
  -X POST \
  -d "{\"code\": \"${YBA_ENV_TYPE}\", \"name\": \"${YBA_USERNAME}\", \"email\": \"${YBA_LOGIN}\", \"password\": \"${YBA_PASSWORD}\", \"confirmPassword\":\"${YBA_PASSWORD}\", \"confirmEULA\": true }"
