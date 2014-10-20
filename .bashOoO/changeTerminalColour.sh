#!/bin/bash

usage()
{
    cat << EOF
Usage: $0 [OPTION_color]
Change the color of xfce terminal.
 -h, --help      print this message and exit
 -de             default color theme of xfce-terminal
 -dc             dark-code
 -dw             dark-white
 -bd             blue-dark
 -yl             yellow-light        
EOF
}
cd ~/.config/xfce4/terminal
case "$1" in
    -dc)
        cp ./color-theme/dark-code/terminalrc .
        ;;
    -de)
        cp ./color-theme/default/terminalrc .
        ;;
    -dw)
        cp ./color-theme/dark-white/terminalrc .
        ;;
    -bd)
        cp ./color-theme/blue-dark/terminalrc .
        ;;
     -yl)
         cp ./color-theme/yellow-light/terminalrc .
         ;;
    -h|--help|*)
        usage
        ;;
esac
#echo "Change Color Finished!"
