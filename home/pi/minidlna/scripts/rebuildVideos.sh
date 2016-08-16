#!/bin/bash

videosFolder=/home/pi/minidlna/VideosRoot/Videos

rm -rf "$videosFolder/*"
./syncVideos.sh $videosFolder
