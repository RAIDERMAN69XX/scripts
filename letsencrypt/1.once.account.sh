#!/bin/sh
# Generate an account key, which may be kept for future use
# to skip some extra Proof of Possession challenges.

openssl genrsa 4096 > account.key
