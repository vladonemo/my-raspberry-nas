#!/bin/bash

folderToSearch=$1

find $1 -ctime -1 -type f -iregex '.*\.\(mpg\|mov\|avi\)' #-exec ./makeLinks.sh . $1 {} +
