# try `find  / -name openssl.cnf` if openssl.cnf cannot be found
OPENSSL_CNF=/etc/ssl/openssl.cnf
# OPENSSL_CNF=/etc/pki/tls/openssl.cnf

DATA_DIR=data
DATA_CHALLENGES=$DATA_DIR/challenges
DATA_ACCOUNT_KEY=$DATA_DIR/account.key
DATA_ACME=$DATA_DIR/acme_tiny.py
DATA_DOMAIN_KEY=$DATA_DIR/domain.key
DATA_CNF=$DATA_DIR/openssl.cnf
DATA_CSR=$DATA_DIR/domain.csr
DATA_SIGNED=$DATA_DIR/signed.crt
DATA_INTERMEDIATE=$DATA_DIR/intermediate.pem
DATA_CHAINED=$DATA_DIR/chained.pem
