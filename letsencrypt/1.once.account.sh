#!/bin/sh
# Generate an account key, which may be kept for future use
# to skip some extra Proof of Possession challenges.

cd `dirname $0`
. ./config.sh
mkdir -p $DATA_CHALLENGES
openssl genrsa 4096 > $DATA_ACCOUNT_KEY
