# Shadowsocks

## Usage

* Create a `config.json` based on `config.example.json`, for more rules see
  <https://github.com/shadowsocks/shadowsocks/wiki/Configuration-via-Config-File>

* Generate or update PAC(`gfwlist.js`):
  ``` sh
  # Make sure genpac is installed:
  $ pip install genpac

  $ sh $SS_DIR/update.sh
  ```

## Usage for Mac OS X and Linux

* Install shadowsocks-libev
  ``` sh
  $ brew install rust
  $ cargo install shadowsocks-rust
  ```

* Switch proxy:
  ``` sh
  $ sh $SS_DIR/setproxy.sh on
  $ sh $SS_DIR/setproxy.sh off
  ```

* Start local
  ``` sh
  $ sh $SS_DIR/start-local.sh
  $ sh $SS_DIR/start-local.sh $SS_DIR/config-other.json
  ```

* Start server
  ``` sh
  $ sh $SS_DIR/start-server.sh
  $ sh $SS_DIR/start-server.sh $SS_DIR/server-other.json
  ```

* Stop
  ``` sh
  # Stop local
  $ sh $SS_DIR/stop.sh

  # Stop server
  $ sh $SS_DIR/stop.sh ssserver
  ```
