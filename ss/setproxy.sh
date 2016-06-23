#!/bin/sh
cd `dirname $0`

if [ "$1" = 'on' ]; then
  ARG="file://$PWD/gfwlist.js"
else
  ARG=off
fi
networksetup -setautoproxyurl 'Wi-Fi' $ARG
