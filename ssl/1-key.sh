#!/bin/sh

cd `dirname $0`
mkdir -p data
openssl genrsa -out data/ca.key 4096
openssl genrsa -out data/server.key 4096
