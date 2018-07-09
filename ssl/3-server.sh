#!/bin/sh

cd `dirname $0`

openssl req -new -key data/server.key -out data/server.csr -subj "/C=CN/ST=Zhejiang/L=Hangzhou/O=Gerald/OU=Gerald/CN=Gerald/emailAddress=i@gerald.top"
openssl x509 -req -days 3650 -sha256 -extfile openssl.cnf -extensions v3_req -CA data/ca.crt -CAkey data/ca.key -CAserial data/ca.srl -CAcreateserial -in data/server.csr -out data/server.crt

cat data/ca.crt data/server.crt > data/chained.crt
