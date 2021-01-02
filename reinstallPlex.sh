#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be started under root privileges" 1>&2
   exit 1
fi

scriptRoot=`dirname $0`

systemctl stop plexmediaserver
echo "Backing up the Plex Media Server library"
bash /home/pi/backup/scripts/backupPlex.sh full noRestart
echo "Installing plex"
bash $scriptRoot/installPlex.sh
systemctl start plexmediaserver
