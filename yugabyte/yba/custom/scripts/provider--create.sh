#!/usr/bin/env bash

set -e
RUNID=$$
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SCRIPT_NAME=$( basename -- "${BASH_SOURCE[0]}" )
logfile=/tmp/tf-$SCRIPT_NAME.log

source $SCRIPT_DIR/common-function.sh

log ---------------------------------Start--------------------------------------



eval "$(jq -r '@sh "api-token=\(.api-token) api=\(.api) body=\(.body) insecure=\(.insecure)"')"
log Input :: api-token=$api_token api=$api insecure=$insecure body=$body

test="foo"

log ---------------------------------End--------------------------------------

jq \
  -n \
  --arg test "$test" \
  '{"test":$test}'
