#!/bin/sh
CWD=`dirname $0`

genpac --gfwlist-url=https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt --user-rule-from=$CWD/user-rule.txt -p "SOCKS5 127.0.0.1:1080" -o $CWD/gfwlist.js
