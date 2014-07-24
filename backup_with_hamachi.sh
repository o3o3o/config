#!/bin/bash
# sync command between two pc with hamachi
# Firstly, you need config .ssh/authorized
#
usage(){
    cat <<EOF
    Usage: \n\t
        $0 -h <IP> <file..> 
EOF
}

case "$1" in
    -h)
        IP=$2
        ;;
    *)
        usage
        exit 0
        ;;
esac

shift 2
scp -p -r $@ michael@${IP}:`pwd -P`
