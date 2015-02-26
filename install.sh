#!/bin/sh
if [`id -u` -ne 0]
then
  echo "please run it by root"
  exit 0
fi

apt-get -y update

apt-get -y install python-pip || {
  echo "could not install python-pip" 
  exit 1
}

apt-get -y install curl || {
  echo "could not install curl"
  exit 1
}

pip install shadowsocks
curl "https://raw.githubusercontent.com/petchat/util_deploy_ssserver/master/config.json" -O /tmp/config.json
ssserver -d start /tmp/config.json
