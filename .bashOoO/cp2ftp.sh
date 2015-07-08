#!/bin/bash
set -o nounset
set -o errexit
# share file  my ftp 

copy2ftp(){
    if [ "$#" != "0" ];then
        #echo "sudo cp $1 $2"
        sudo cp -r $@
        sudo chown -R ftp:ftp ${@: -1}
    fi
}
copy2ftp  $@

