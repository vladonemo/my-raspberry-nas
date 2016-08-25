#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

scriptRoot=`dirname $0`

echo "Backing up the Plex Media Server library"
bash /home/pi/backup/scripts/backupPlex.sh full
echo "Installing plex"
bash $scriptRoot/installPlex.sh
