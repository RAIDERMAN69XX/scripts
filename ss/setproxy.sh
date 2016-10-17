#!/bin/sh
cd `dirname $0`
SERVICE=Wi-Fi

exists() {
  declare -f -F $1 > /dev/null
  return $?
}

set_pac() {
  if [ "$1" = "off" ]; then
    networksetup -setautoproxystate $SERVICE off
  else
    networksetup -setautoproxyurl $SERVICE "file://$PWD/gfwlist.js"
  fi
}

set_socks() {
  if [ "$1" = "off" ]; then
    networksetup -setsocksfirewallproxystate $SERVICE off
  else
    networksetup -setsocksfirewallproxy $SERVICE 127.0.0.1 1080
  fi
}

switch_off() {
  switch_pac off
  switch_socks off
}

switch_pac() {
  if [ "$1" = "off" ]; then
    set_pac off
  else
    set_pac
    set_socks off
  fi
}

switch_socks() {
  if [ "$1" = "off" ]; then
    set_socks off
  else
    set_socks
    set_pac off
  fi
}

show_help() {
  echo USAGE
  echo \> setproxy.sh off
  echo \> setproxy.sh pac [off]
  echo \> setproxy.sh socks [off]
}

func=switch_$1
if exists $func; then
  $func $2
else
  show_help
fi
