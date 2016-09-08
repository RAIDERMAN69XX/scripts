Let's Encrypt
===

Issue and renew [Let's Encrypt](https://letsencrypt.org/) certificates.

Usage
---
All scripts will be run in the same directory as themselves.

For initial use, run scripts 1-4.

Modify nginx config files like this:

``` conf
server {
    listen 80;
    server_name gerald.top www.gerald.top;

    location /.well-known/acme-challenge/ {
        alias /absolute/path/to/challenges/;
        try_files $uri =404;
    }

    location / {
        return 301 https://gerald.top$request_uri;
    }
}

server {
    listen       443 ssl;
    server_name  gerald.top;

    ssl_certificate      /absolute/path/to/chained.pem;
    ssl_certificate_key  /absolute/path/to/domain.key;

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
        alias /absolute/path/to/static;
        try_files $uri =404;
    }
}
```

For renewals, just run script 4.

Be aware that the certificate expires every 90 days. Automatical renewals
may be set up by `crontab -e` and append lines below:

```
0 0 1 * * /absolute/path/to/4.cert.sh >/dev/null 2>&1
```

References
---
1. https://github.com/diafygi/acme-tiny
1. https://imququ.com/post/letsencrypt-certificate.html
