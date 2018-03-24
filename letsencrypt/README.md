Let's Encrypt
===

Issue and renew [Let's Encrypt](https://letsencrypt.org/) certificates.

Usage
---
All scripts will be run in the same directory as themselves.

For initial use, run scripts 1-4. For renewals, just run script 4.

### Step 1

Run script 1 **once**. Create account key.

### Step 2

Run script 2 **once**. Download acme-tiny script.

### Step 3

Run script 3 **every time after domains are changed**. Create the CSR.

### Step 4

Make sure nginx is correctly configured.

* `server_name` should contain all the server names to be verified.

``` conf
# HTTP
server {
    listen 80;
    server_name gerald.top www.gerald.top;

    location /.well-known/acme-challenge/ {
        alias /absolute/path/to/data/challenges/;
        try_files $uri =404;
    }

    location / {
        return 301 https://$host$request_uri;
    }
}
```

Run script 4 and reload nginx **regularly**.

Be aware that the certificate expires every 90 days. Automatical renewals
may be set up by `crontab -e` and append lines below:

```
0 0 1 * * /absolute/path/to/4.cert.sh && nginx -s reload
```

### Step 5

Configure for HTTPS:

```
# HTTPS
server {
    listen       443 ssl;
    server_name  gerald.top;

    ssl_certificate      /absolute/path/to/data/chained.pem;
    ssl_certificate_key  /absolute/path/to/data/domain.key;

    ssl_session_cache shared:SSL:1m;
    ssl_session_timeout  5m;

    ssl_ciphers  HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers   on;

    location / {
        proxy_pass       http://localhost:3000;
        proxy_set_header Host      $host;
        proxy_set_header X-Real-IP $remote_addr;
    }

    location /static/ {
        alias /absolute/path/to/static/;
        try_files $uri =404;
    }
}
```

References
---
1. https://github.com/diafygi/acme-tiny
1. https://imququ.com/post/letsencrypt-certificate.html
