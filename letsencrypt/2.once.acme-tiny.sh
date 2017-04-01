#!/bin/sh
# Make a directory for challenges
# Fetch acme-tiny script

cd `dirname $0`
. ./config.sh

wget -O - https://raw.githubusercontent.com/diafygi/acme-tiny/master/acme_tiny.py > $DATA_ACME
# curl https://raw.githubusercontent.com/diafygi/acme-tiny/master/acme_tiny.py > $DATA_ACME
