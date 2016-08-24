#!/bin/bash

if [ ! -f "$1" ]; then
  echo Please provide the backup file list.
  exit
fi

if [ ! -d "$2" ]; then
  echo Please provide backup directory as an argument.
  exit
fi

if [ ! -d "$3" ]; then
  echo Please provide restore directory as an argument.
  exit
fi

input="$2"
output="$3"

./copyFiles.sh $1 $input $output

while read line
do
  elements=($line)
  case "${elements[0]}" in
    "link")
      echo Creating $line
      mkdir -p `dirname $output${elements[2]}`
      ln -s ${elements[1]} $output${elements[2]}
      ;;
  esac
done < $1
