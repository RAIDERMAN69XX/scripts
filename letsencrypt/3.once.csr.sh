#!/bin/sh

cd `dirname $0`

# 1. Generate a domain key

# RSA
# openssl genrsa 4096 > domain.key

# ECC
openssl ecparam -genkey -name secp384r1 | openssl ec -out domain.key

# 2. Create CSR

# Interactive way
openssl req -new -sha256 -key domain.key -out domain.csr

# Simple way
# openssl req -new -sha256 -key domain.key -subj "/" -reqexts SAN -config <(cat /etc/ssl/openssl.cnf <(printf "[SAN]\nsubjectAltName=DNS:gerald.top,DNS:www.gerald.top"))> domain.csr

# Read domains.txt file
# openssl req -new -sha256 -key domain.key -subj "/" -reqexts SAN -config <(cat /etc/pki/tls/openssl.cnf <(python -c "print('[SAN]\nsubjectAltName='+','.join(map(lambda x:'DNS:'+x,filter(None,map(str.strip,open('domains.txt').read().split('\n'))))))"))> domain.csr

# try `find  / -name openssl.cnf` if openssl.cnf cannot be found
