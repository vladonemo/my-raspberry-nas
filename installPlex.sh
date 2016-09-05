#!/bin/bash

logFile=/home/pi/plex_installation.log

echo "Installing plex Media Server"
cd /tmp
sudo wget "https://plex.tv/downloads/latest/1?channel=16&build=linux-annapurnatrans-arm7&distro=readynas6" -O plex.deb | tee -a $logFile
sudo mkdir -p /usr/lib/plexmediaserver
sudo bash -c "ar p plex.deb data.tar.gz | tar -xzf - -C /usr/lib/plexmediaserver/ --strip-components=4 ./apps/plexmediaserver-annapurna/Binaries"
sudo rm /usr/lib/plexmediaserver/config.xml
sudo rm /tmp/plex.deb
echo "Installation done"
