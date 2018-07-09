# Self-Signed Certificate

## Usage

### Step 1

Create private keys for CA and server.

### Step 2

Sign your CA certificate.

### Step 3

Sign your server certificate with your CA certificate.

### Step 4

Add `data/ca.crt` to your system-wide trusted certificates.

### Step 5

Start a server with `data/server.key` as `key`, `data/server.crt` as `cert`, `data/ca.crt` as CA certificates. Here is an example for Node.js:

```js
const options = {
  key: fs.readFileSync('data/server.key'),
  cert: fs.readFileSync('data/server.crt'),
  ca: [fs.readFileSync('data/ca.crt')],
};
https.createServer(options, callback).listen(443);
```

Or use `data/chained.pem` as the chained certificate.
