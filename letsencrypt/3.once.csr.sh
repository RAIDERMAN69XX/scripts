#!/bin/sh

cd `dirname $0`
. ./config.sh

# 1. Generate a domain key

# RSA
# openssl genrsa 4096 > domain.key

# ECC
openssl ecparam -genkey -name secp384r1 | openssl ec -out $DATA_DOMAIN_KEY

# 2. Create CSR

# Interactive way
# openssl req -new -sha256 -key domain.key -out domain.csr

# Simple way: read domains.txt
cat $OPENSSL_CNF > $DATA_CNF
python read_domains.py >> $DATA_CNF
openssl req -new -sha256 -key $DATA_DOMAIN_KEY -subj "/" -reqexts SAN -config $DATA_CNF > $DATA_CSR
