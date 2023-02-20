#!/usr/bin/env bash

set -Eeuo pipefail
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
# PROJECT_DIR=$( cd ${SCRIPT_DIR}/.. ; pwd)

YB_WORK=${YB_WORK:-/opt/yugabyte}
YB_HOME=${YB_HOME:-/home/yugabyte}
YB_USER=${YB_USER:-yugabyte}
YUGAWARE_CONF=${YUGAWARE_CONF:-/etc/yugaware.conf}
REPLICATED_CONF=${REPLICATED_CONF:-/etc/replicated.conf}
LICENCE_FILE=${LICENCE_FILE:-/etc/yugaware.rli}
PACKAGE_ROOT=${YB_WORK}/packages
STAGING_BUCKET=${STAGING_BUCKET:-s3://yba-config}
YB_PORTAL=${YB_PORTAL:-https://localhost}
YW_API="$YB_PORTAL/api/v1"

[[ ! -f ${YUGAWARE_CONF} ]] && echo "${YUGAWARE_CONF} missing" && exit 1
[[ ! -f ${REPLICATED_CONF} ]] && echo "${REPLICATED_CONF} missing" && exit 1
[[ ! -f ${LICENCE_FILE} ]] && echo "${LICENCE_FILE} missing" && exit 1

ONLINE_INSTALL=${ONLINE_INSTALL:-1}

HOST_IP=$(ip -4 -o addr show dev eth0 | awk {'print $4'} | cut -d/ -f1)
echo "Update ${YUGAWARE_CONF}"
sed -i "s/<hostname>/$HOST_IP/" ${YUGAWARE_CONF}

if [[ $ONLINE_INSTALL == "0"  ]]
then

  [[ ! -d ${PACKAGE_ROOT} ]] && echo "No package folder found. Downloading now" &&  aws s3 cp --no-progress --recursive ${STAGING_BUCKET}/packages ${PACKAGE_ROOT}

  [[ ! -f ${PACKAGE_ROOT}/replicated/replicated.tar.gz ]] && echo "${PACKAGE_ROOT}/replicated/replicated.tar.gz: missing" && exit 11

  ybpkg=$(cat ${REPLICATED_CONF} | grep LicenseBootstrapAirgapPackagePath | cut -d: -f2 | sed -e 's#.*"\(/.*\)",#\1#')
  [[ ! -f $ybpkg ]] &&  echo "[${ybpkg}]: missing" &&  exit 1


  echo "Unpack replicated"
  tar -C ${PACKAGE_ROOT}/replicated -xzvf ${PACKAGE_ROOT}/replicated/replicated.tar.gz


  (
  echo "Installing Replicated"
  cd ${PACKAGE_ROOT}/replicated
  ./install.sh airgap local-address="$HOST_IP"  private-address="$HOST_IP" fast-timeouts
  )
else
  curl -sSL https://get.replicated.com/docker | sudo bash -s -- local-address="$HOST_IP"  private-address="$HOST_IP" fast-timeouts no-proxy skip-preflights no-public-address
fi
echo "$YB_PORTAL: Not up. Waiting.."
while ! curl -sSkLo /dev/null ${YW_API}/customer_count -f &> /dev/null
do
  echo -n "."
  sleep 2
done

echo  "$YB_PORTAL: is UP!";
echo "Yugaware Install Completed"
