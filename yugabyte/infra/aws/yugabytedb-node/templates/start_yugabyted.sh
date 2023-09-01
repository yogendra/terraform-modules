#!/usr/bin/env bash
set -Eeuo pipefail
YB_HOME=/home/$${USER}/yugabyte-db
source $${YB_HOME}/.yb_env.sh

cat <<EOM > $${YB_HOME}/master.flags
%{ for key, value in master-gflags ~}
--${key}=${value}
%{ endfor}
EOM

cat <<EOM > $${YB_HOME}/tserver.flags
%{ for key, value in tserver-gflags ~}
--${key}=${value}
%{ endfor}
EOM

cat <<EOM > $${YB_HOME}/yugabyted.conf
{
  %{ for key, value in yugabyted-conf ~}
  "${key}":"${value}",
  %{ endfor ~}
  "master_flags" : "flagfile=$${YB_HOME}/master.flags",
  "tserver_flags": "flagfile=$${YB_HOME}/tserver.flags"
}
EOM

if [[ -n "${join-master}" ]]; then
  until echo /dev/tcp/${join-master}/7100; do
    echo "[Master/${join-master}] Waiting to be ready..."
    sleep 1
  done
  echo "[Master/${join-master}] Ready"
fi
sleep 5
pushd $YB_HOME
nohup yugabyted start \
  --config=$${YB_HOME}/yugabyted.conf \
%{ for key, value in parameters ~}
  --${key}="${value}" \
%{ endfor ~}
&> /tmp/yugabyted.log &
echo See statup logs at : /tmp/yugabyted.log
popd
