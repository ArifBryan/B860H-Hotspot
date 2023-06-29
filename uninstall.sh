#!/bin/bash

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

systemctl stop hotspot.service

systemctl disable hotspot.service

rm -rf /etc/systemd/system/hotspot.service

rm -rf /usr/bin/lnxrouter
rm -rf /usr/bin/hotspotConfig

systemctl daemon-reload

echo 'Uninstall finished!'
