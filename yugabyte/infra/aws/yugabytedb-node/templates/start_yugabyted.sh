#!/usr/bin/env bash
set -Eeuo pipefail
YB_HOME=/home/$USER/yugabyte-db
source $YB_HOME/.yb_env.sh
JOIN_MASTER=${join-master}

cat <<EOM > $YB_HOME/master.flags
%{ for key, value in master-gflags ~}
--${key}=${value}
%{ endfor}
EOM

cat <<EOM > $YB_HOME/tserver.flags
%{ for key, value in tserver-gflags ~}
--${key}=${value}
%{ endfor}
EOM

if [[ ! -f $YB_HOME/yugabyted.conf ]]; then
cat <<EOM > $YB_HOME/yugabyted.conf
  {
    %{ for key, value in yugabyted-conf ~}
    "${key}":"${value}",
    %{ endfor ~}
    "master_flags" : "flagfile=$YB_HOME/master.flags",
    "tserver_flags": "flagfile=$YB_HOME/tserver.flags"
  }
EOM
fi

if [[ -n $JOIN_MASTER ]]; then
  until echo /dev/tcp/$JOIN_MASTER/7100; do
    echo "[Master/$JOIN_MASTER] Waiting to be ready..."
    sleep 1
  done
  echo "[Master/$JOIN_MASTER] Ready"
fi
sleep 5
pushd $YB_HOME
nohup yugabyted start \
  --config=$YB_HOME/yugabyted.conf \
%{ for key, value in parameters ~}
  --${key}="${value}" \
%{ endfor ~}
&> /tmp/yugabyted.log &
echo See statup logs at : /tmp/yugabyted.log

if [[ -z $JOIN_MASTER ]]; then
  until pg_isready --h $(hostname -I) ; do
    echo "Waiting for PG to be ready..."
    sleep 5
  done
  yugabyted configure data_placement  \
    --config ~/yugabyte-db/yugabyted.conf \
    --fault_tolerance ${fault-tolerance} \
    --rf ${replication-factor} \
    &> /tmp/yugabyted-config-data.log
  echo Configured data placement constraints on cluster. See logs at /tmp/yugabyted-config-data.log
fi
popd
