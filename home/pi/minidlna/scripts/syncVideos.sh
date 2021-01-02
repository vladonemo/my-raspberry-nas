#!/bin/bash

dirName=`dirname "$0"`
dirName=`( cd "$dirName" && pwd )`

"$dirName"/syncLinks.sh /media/USBHDD_Main/Videos $1
"$dirName"/syncLinks.sh /media/USBHDD_Main/Photos/Raw $1
"$dirName"/syncLinks.sh '/media/USBHDD_Main/Photos/Z mobilu/Nemo' $1
"$dirName"/syncLinks.sh '/media/USBHDD_Main/Photos/Z mobilu/Wewe' $1
"$dirName"/syncLinks.sh /media/USBHDD_Main/Photos/Chrumkaci $1/Chrumkaci

#delete all broken links
find $1 -type l -exec test ! -e {} \; -delete
#delete all empty folders
find $1 -type d -empty -delete
