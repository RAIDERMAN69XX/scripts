#!/bin/sh
CWD=`dirname $0`
PROXY='SOCKS5 127.0.0.1:1080'

genpac --gfwlist-url=https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt --user-rule-from=$CWD/user-rule.txt -p "$PROXY" --gfwlist-proxy="$PROXY" -o $CWD/gfwlist.js
