#!/bin/bash

input="$2"
output="$3"

while read line
do
  echo Processing $line
  elements=($line)
  case "${elements[0]}" in
    "copyFolder")
      mkdir -p $output${elements[1]}
      cp $input${elements[1]}/* $output${elements[1]}
      ;;
    "copy")
      mkdir -p `dirname $output${elements[1]}`
      cp $input${elements[1]} $output${elements[1]}
      ;;
  esac
done < $1
