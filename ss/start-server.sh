#!/bin/sh
CWD=`dirname $0`
CONF=$1

if [ -z "$CONF" ]; then
  CONF="$CWD/server.json"
fi

nohup ss-server -c $CONF > $CWD/ss.log &
