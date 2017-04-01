#!/bin/sh
# Create and renew certificates

set -e
cd `dirname $0`
. ./config.sh
echo [`TZ=Asia/Shanghai date '+%Y-%m-%d %H:%M:%S'`]
python $DATA_ACME --account-key $DATA_ACCOUNT_KEY --csr $DATA_CSR --acme-dir $DATA_CHALLENGES > $DATA_SIGNED
wget -O - https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem > $DATA_INTERMEDIATE
cat $DATA_SIGNED $DATA_INTERMEDIATE > $DATA_CHAINED

nginx -s reload
