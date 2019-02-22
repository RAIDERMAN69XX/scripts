#!/bin/sh
CWD=`dirname $0`
CONF=$1

if [ -z "$CONF" ]; then
  CONF="$CWD/config.json"
fi

nohup sslocal -c $CONF > $CWD/ss.log &
