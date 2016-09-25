#!/bin/sh
# Create and renew certificates

cd `dirname $0`
set -e
echo [`TZ=Asia/Shanghai date '+%Y-%m-%d %H:%M:%S'`]
python acme_tiny.py --account-key account.key --csr domain.csr --acme-dir $PWD/challenges/ > signed.crt
wget -O - https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem > intermediate.pem
cat signed.crt intermediate.pem > chained.pem
