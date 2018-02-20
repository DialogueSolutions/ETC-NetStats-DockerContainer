Ethereum Classic Network Stats
============
[![Build Status][travis-image]][travis-url] [![dependency status][dep-image]][dep-url]

This is a visual interface for tracking ethereum classic network status. It uses WebSockets to receive stats from running nodes and output them through an angular interface. It is the front-end implementation for [etc-net-intelligence-api](https://github.com/Machete3000/etc-net-intelligence-api).

![Screenshot](https://raw.githubusercontent.com/Machete3000/etc-netstats/master/src/images/screenshot.jpg?v=0.0.6 "Screenshot")

## Prerequisite
* node
* npm

## Installation
Make sure you have node.js and npm installed.

Clone the repository and install the dependencies

```bash
git clone https://github.com/Machete3000/etc-netstats
cd etc-netstats
npm install
sudo npm install -g grunt-cli
```

## Build the resources
NetStats features two versions: the full version and the lite version. In order to build the static files you have to run grunt tasks which will generate dist or dist-lite directories containing the js and css files, fonts and images.


To build the full version run
```bash
grunt
```

To build the lite version run
```bash
grunt lite
```

If you want to build both versions run
```bash
grunt all
```

## Run

```bash
npm start
```

see the ETC Stats interface at http://localhost:3000

## Run in PM2 - daemon mode.
* Install PM2:
```bash 
sudo npm install -g pm2
```

* Create an app.json file in the local directory of eth-netstats:
```json[
  {
    "name"        : "eth-netstats",
    "cwd"         : "<folder-path-to-etc-netstats-e.g. /home/etc-netstats/>",
    "script"      : "app.js",
    "log_date_format"   : "YYYY-MM-DD HH:mm Z",
    "merge_logs"    : false,
    "watch"       : false,
    "exec_interpreter"  : "node",
    "exec_mode"     : "fork_mode",
    "env":
    {
      "NODE_ENV"    : "development",
      "PORT"           : <port>,
      "WS_SECRET"     : "<password>"
    }
  }
]
```
* Run etc-netstats as PM2 service and persist the service for reboot
```bash
pm2 start ./app.json
pm2 save
```

see the ETC Stats interface at http://localhost:3000

[travis-image]: https://travis-ci.org/Machete3000/etc-netstats.svg
[travis-url]: https://travis-ci.org/Machete3000/etc-netstats
[dep-image]: https://david-dm.org/Machete3000/etc-netstats.svg
[dep-url]: https://david-dm.org/Machete3000/etc-netstats
