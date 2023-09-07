#!/usr/bin/env bash
set -Eeuo pipefail
YB_HOME=/home/$USER/yugabyte-db
source $YB_HOME/.yb_env.sh

YB_DATA_ROOT=/home/$USER/data
YB_DATA=$YB_DATA_ROOT/yb-data
YB_CONFIG=$YB_DATA_ROOT/yugabyted.conf
YB_MASTER_FLAGS=$YB_DATA_ROOT/master.flags
YB_TSERVER_FLAGS=$YB_DATA_ROOT/tserver.flags
RF=${replication-factor}
FT=${fault-tolerance}
JOIN_MASTER=${join-master}
LOG=/tmp/start-yugabyted.log

echo See statup logs at : $LOG | tee -a $LOG

echo Create master gflag file: $YB_MASTER_FLAGS | tee -a $LOG
cat <<EOM > $YB_MASTER_FLAGS
%{ for key, value in master-gflags ~}
--${key}=${value}
%{ endfor}
EOM

echo Create tserver gflag file: $YB_TSERVER_FLAGS | tee -a $LOG
cat <<EOM > $YB_TSERVER_FLAGS
%{ for key, value in tserver-gflags ~}
--${key}=${value}
%{ endfor}
EOM

if [[ ! -f $YB_CONFIG ]]; then
echo Create yugabyted config file: $YB_CONFIG | tee -a $LOG
cat <<EOM > $YB_CONFIG
{
  %{ for key, value in yugabyted-conf ~}
  "${key}":"${value}",
  %{ endfor ~}
  "master_flags" : "flagfile=$YB_MASTER_FLAGS",
  "tserver_flags": "flagfile=$YB_TSERVER_FLAGS"
}
EOM
fi

if [[ -n $JOIN_MASTER ]]; then
  echo Wait for master nodes : $JOIN_MASTER | tee -a $LOG
  until echo /dev/tcp/$JOIN_MASTER/7100; do
    echo "[Master/$JOIN_MASTER] Waiting to be ready..." | tee -a $LOG
    sleep 10
  done
  sleep 10
  echo "[Master/$JOIN_MASTER] Ready" | tee -a $LOG
fi
pushd $YB_HOME
echo "Starting yugabytd with base_dir $YB_DATA and config $YB_CONFIG" | tee -a $LOG
nohup yugabyted start \
  --base_dir=$YB_DATA \
  --config=$YB_CONFIG \
%{ for key, value in parameters ~}
  --${key}="${value}" \
%{ endfor ~}
|& tee -a $LOG &


if [[ -z $JOIN_MASTER ]]; then
  until pg_isready --h $(hostname -I) ; do
    echo "Waiting for PG to be ready..." |& tee -a $LOG
    sleep 5
  done
  echo "PG is be ready..." |& tee -a $LOG

  if [[ "$(yb-admin   -init_master_addrs $(hostname):7100 get_universe_config | wc -c)" -le 67 ]] ; then
    yugabyted configure data_placement  \
      --base_dir=$YB_DATA \
      --config=$YB_CONFIG \
      --fault_tolerance=$FT \
      --rf=$RF \
      |& tee -a $LOG
    echo Configured data placement constraints on cluster. See logs at /tmp/yugabyted-config-data.log |& tee -a $LOG
  fi
fi
popd
