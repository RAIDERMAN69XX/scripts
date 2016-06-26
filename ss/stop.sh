#!/bin/sh

PROCESS=$1
if [ -z "$PROCESS" ]; then
  PROCESS=ss-local
fi

PID=`ps x | grep $PROCESS | grep -v grep | awk '{print $1}'`

if [ -n "$PID" ]; then
  kill $PID
fi
