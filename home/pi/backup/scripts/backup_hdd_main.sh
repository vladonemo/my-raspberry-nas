#!/bin/bash
if [ "$2" = "incremental" ]; then
    type=incremental
else
    type=full
fi

/usr/bin/backup-script.sh /media/USBHDD_Main/$1/ $1 $2 > /home/pi/backup/log/`date +\%Y-\%m-\%d-\%s`_$1_$type.log 2>&1
