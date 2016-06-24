Shadowsocks
===

Usage
---

* Create a `config.json` based on `config.example.json`, for more rules see
  <https://github.com/shadowsocks/shadowsocks/wiki/Configuration-via-Config-File>

* Generate or update PAC(`gfwlist.js`):
  ``` sh
  # Make sure genpac is installed:
  $ pip install genpac

  $ sh $SS_DIR/update.sh
  ```

Usage for Mac OS X
---
* Install shadowsocks-libev
  ``` sh
  $ brew install shadowsocks-libev
  ```

* Switch proxy:
  ``` sh
  $ sh $SS_DIR/setproxy.sh on
  $ sh $SS_DIR/setproxy.sh off
  ```

* Start
  ``` sh
  $ sh $SS_DIR/start.sh
  $ sh $SS_DIR/start.sh $SS_DIR/other_config.json
  ```

* Stop
  ``` sh
  $ sh $SS_DIR/stop.sh
  ```
