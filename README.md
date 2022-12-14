# cosmos-crawler
Tool for crawling Tendermint RPC nodes

## Dependencies 
- curl
- jq
- bash

Tested on MacOS and Ubuntu 22.04 - YMMV on other Linux distros

## How It Works

This BASH script expects to be run within the crawl folder and will generate two files for each RPC node discovered

```<RPC node IP>.net_info.json```

and

```status.<RPC node IP>.json```

The `DLY` variable is set to 3 seconds by default - if `curl` does not receive a JSON response within this time, the source will be skipped.

The `SEED` variable must be set to an RPC endpoint (must be an IP address for this script, but this could be optimized later with a call to a DNS server) - current `SEED` value is a Kujira endpoint from [@mintthemoon](https://github.com/mintthemoon) (thanks!!)

Steps to run - 

Make crawl.sh executable

```sudo chmod a+x crawl.sh```

Then run from the crawl directory

```./crawl.sh```

This will take time to complete.  Each RPC node will be crawled ONCE.  If a net_info JSON file exists on disk for a discovered peer IP, the RPC node will not be scanned again.  NOTE: this means that any new peers attached to this same RPC source since the previous interaction may be missed.

When the data is received, consider using an availble IP database to discover ISP and location information for each node (e.g. `http://ip-api.com/json/192.168.0.1`)
