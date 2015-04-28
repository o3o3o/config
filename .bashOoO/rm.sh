#!/bin/bash
Trash='~/.local/share/Trash/'
#BUG?
for i in $@
    do
        file = `ls $Trash/files/* | grep $i`
        if [ -z $file]
        then
            echo "mv $i $Trash/files/"
            echo -e "[Trash Info]\nPath=$(dirname $i)\nDeletionDate=$(date '+%FT%T')\n>>$(basename $i)"
            #echo -e "[Trash Info]\nPath=$(dirname $i)\nDeletionDate=$(date '+%FT%T')" >> `basename $i`
            echo "mving $i to $Trash Finished!"
        fi
    done
