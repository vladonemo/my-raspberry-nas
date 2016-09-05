#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if [ "$1" = "incremental" ]; then
    type=incremental
else
    type=full
fi

logFile="/home/pi/backup/log/`date +\%Y-\%m-\%d-\%s`_pms_$type.log"

if [ "$2" == "noRestart" ]; then
else
    echo "Stopping Plex Media Server" | tee -a $logFile
    systemctl stop plexmediaserver | tee -a $logFile
fi

echo "Backing up Plex Media Server Library" | tee -a $logFile
/usr/bin/backup-script.sh /var/lib/plexmediaserver/ PlexMediaServer $1 $lofFile 2>&1 | tee -a $logFIle

if [ "$2" == "noRestart" ]; then
else
    echo "Starting Plex Media Server" | tee -a $logFile
    systemctl start plexmediaserver | tee -a $logFile
fi
