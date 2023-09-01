#!/usr/bin/env bash
set -Eeuo pipefail
YB_HOME=/home/$${USER}/yugabyte-db
source $${YB_HOME}/.yb_env.sh
CONFIG_PARAM=""
if [[ -Z "${yugabyted-conf}" ]]; then
  cat <<EOM > $${YB_HOME}/yugabyted.conf
  ${yugabyted-conf}
EOM
  CONFIG_PARAM="--config=$${YB_HOME}/yugabyted.conf"

fi
pushd $YB_HOME
bin/yugabyted start \
  $CONFIG_PARAM \
%{ for key, value in parameters ~}
  --${key}="${value}" \
%{ endfor}
popd
