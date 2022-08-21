# cosmos-crawler
Tool for crawling Tendermint RPC nodes

Tested on MacOS and Ubuntu 22.04 - YMMV on other Linux distros

This BASH script expects to be run within the crawl folder and will generate two files for each RPC node discovered

```net_info.<RPC node IP>.json```

and

```status.<RPC node IP>.json```

Each RPC node will be crawled ONCE.  If a net_info JSON file exists on disk for a discovered peer IP, the RPC node will not be scanned again.  NOTE: this means that any new peers attached to this same RPC source since the previous interaction may be missed.