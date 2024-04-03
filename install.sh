#!/bin/bash

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

apt update
apt install -y dnsmasq hostapd

git clone https://github.com/garywill/linux-router
chmod +x linux-router/lnxrouter

cp linux-router/lnxrouter /usr/bin/
cp hotspotConfig /usr/bin/

cp hotspot.service /etc/systemd/system/

systemctl enable hotspot.service

systemctl daemon-reload
systemctl start hotspot.service

echo 'Install finished!'
