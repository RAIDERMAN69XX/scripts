#!/bin/sh
# Make a directory for challenges
# Fetch acme-tiny script

cd `dirname $0`
mkdir challenges 2>/dev/null

wget https://raw.githubusercontent.com/diafygi/acme-tiny/master/acme_tiny.py
# curl https://raw.githubusercontent.com/diafygi/acme-tiny/master/acme_tiny.py > acme_tiny.py
