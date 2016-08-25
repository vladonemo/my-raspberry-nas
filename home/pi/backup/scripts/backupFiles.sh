#!/bin/bash

if [ ! -f "$1" ]; then
  echo Please provide the backup file list.
  exit
fi

if [ ! -d "$2" ]; then
  echo Please provide backup directory as an argument.
  exit
fi

./copyFiles.sh $1 "/" $2
