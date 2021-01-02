#!/bin/bash

destination="$1"
folderToSearch="$2"
shift
shift
for x; do
    folder="${x%/*}"
    echo creating folder "$destination/${folder#$folderToSearch}"
    mkdir -p "$destination/${folder#$folderToSearch}";
    if [ ! -L "$destination/${x#$folderToSearch}" ]
    then
        echo creating link "$destination/${x#$folderToSearch}" -\> "$x"
        ln -s "$x" "$destination/${x#$folderToSearch}";
    else
        echo link "$destination/${x#$folderToSearch}" already exists
    fi
done
