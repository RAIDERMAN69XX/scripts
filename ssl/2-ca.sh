#!/bin/sh

cd `dirname $0`

openssl req -new -key data/ca.key -out data/ca.csr -subj "/C=CN/ST=Zhejiang/L=Hangzhou/O=Gerald CA/OU=Gerald CA/CN=Gerald CA/emailAddress=i@gerald.top"
openssl x509 -req -days 3650 -sha256 -signkey data/ca.key -in data/ca.csr -out data/ca.crt
