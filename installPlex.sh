#!/bin/bash

logFile=/home/pi/plex_installation.log

echo "Installing plex Media Server"
cd /tmp
sudo wget https://downloads.plex.tv/plex-media-server/1.0.3.2461-35f0caa/plexmediaserver-ros6-binaries-annapurna_1.0.3.2461-35f0caa_armel.deb -O plex.deb | tee -a $logFile
sudo mkdir -p /usr/lib/plexmediaserver
sudo bash -c "ar p plex.deb data.tar.gz | tar -xzf - -C /usr/lib/plexmediaserver/ --strip-components=4 ./apps/plexmediaserver-annapurna/Binaries"
sudo rm /usr/lib/plexmediaserver/config.xml
sudo rm /tmp/plex.deb
echo "Installation done"
