#!/bin/bash
set -o nounset
set -o errexit
# share file  my ftp 

copy2ftp(){
    if [ "$#" != "0" ];then
        sudo cp $1 $2 
        sudo chown -R ftp:ftp $2
    fi
}
copy2ftp  $@

