#!/usr/bin/env bash

set -e

funtion yba-api(){
  api_token=$1;shift
  method=$1; shift
  url=$1; shift
  body=$1: shift
  body_part=""
  if [[ -n $body ]]; then body_part="-d $body"
  curl -kfsSL "$url" -X $method -H content-type:application/json -H accept:application/json -H X-AUTH-YW-API-TOKEN:$api_token $body_part
}
function session_info(){
  api_token=$1;shift
  api=$1; shift
  yba-api $api_token "GET" "$api/session_info"
}
function log(){
  echo "[$(date -Iseconds)] [$RUNID] $@" >> $logfile
}
