#!/bin/bash

dirName=`dirname "$0"`
dirName=`( cd "$dirName" && pwd )`

folderToSearch="${1}"
destination=$2
find "$folderToSearch" -type f -iregex '.*\.\(mpg\|mov\|avi\|wmv\|mp4\|mpeg\|mkv\|mpg4\|mpeg4\)' -exec "$dirName"/makeLinks.sh $destination "$folderToSearch" {} +
