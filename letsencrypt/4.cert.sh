#!/bin/sh
# Create and renew certificates

python acme_tiny.py --account-key account.key --csr domain.csr --acme-dir $PWD/challenges/ > signed.crt || exit
wget -O - https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem > intermediate.pem
cat signed.crt intermediate.pem > chained.pem
