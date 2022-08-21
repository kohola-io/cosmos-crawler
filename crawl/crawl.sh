#!/bin/bash
SEED="23.175.144.185:26657"
DLY=3

function get_status() {
  if curl -s "http://$1/status" -o "status.$1.json" -m $DLY
  then echo "$1: get status was successful"
  else echo "$1: get status failed"
  fi
  return
}

function get_peers() {
  echo -e "$1\n"
  peer="$1.net_info.json"
  if curl -s "http://$1/net_info" -o $peer -m $DLY
  then
    get_status $1
    echo "$1: get net_info was successful"
    local file=$(jq '(.result.peers[] | .remote_ip + ":" + (.node_info.other.rpc_address | split (":") | last))'<$peer)
    for line in $file; do
      echo -e "	$line\n"
      line=$(echo $line | tr -d '"')
      if test -e "$line.net_info.json"
      then continue
      else 
        get_peers $line
      fi
    done
  else 
    echo "$1: get net_info failed"
    return
  fi
  return
}

get_peers $SEED

