#!/usr/bin/env bash
set -Eeuo pipefail
YB_HOME=/home/${USER}/yugabyte-db
source ${YB_HOME}/.yb_env.sh
YUGABYTED_JOIN_HOST=${1:}; shift

[[ $YUGABYTED_JOIN_HOST != ""  ]] && export YBD_ARG_JOIN="--join=$YB_JOIN_HOST"
pushd $YB_HOME
bin/yugabyted start $YBD_ARG_JOIN
popd
