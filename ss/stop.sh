#!/bin/sh

PROCESS=ss-local
PID=`ps x | grep $PROCESS | grep -v grep | awk '{print $1}'`

if [ -n "$PID" ]; then
  kill $PID
fi
