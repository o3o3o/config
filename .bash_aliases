
alias cp='cp -i'
alias d='dirs -v'
alias sl='sl -e'
alias SL='sl -e'
alias booklist='~/.bashOoO/booklist.sh'
alias Rdesktop='~/.bashOoO/Rdesktop.sh'
alias MySql='~/.bashOoO/MySql.sh'
alias backup2183='~/.bashOoO/backup2183.sh'
#you hamachi id
OoO_IP=$(hamachi list|grep 'you_hamachi_id'|awk '{ print $4 }'|uniq)
alias bk2OoO='~/.bashOoO/backup2OoO.sh -h ${OoO_IP}'

alias t='todo'
alias ta='todo all'
alias f='fortune'
alias W='~/.bashOoO/weather.sh'
alias dict='~/.bashOoO/dict.sh'
alias say='~/.bashOoO/say.sh'
alias dropboxd='~/.dropbox-dist/dropboxd'
#alias fgw='/opt/longene/qq2012/wine/bin/wine ~/.bashOoO/fg739p.exe'
alias fgw='/opt/longene/qq2012/wine/bin/wine ~/.bashOoO/fg742p.exe'
#alias fgw='/opt/longene/qq2012/wine/bin/wine ~/.bashOoO/DynaPass32.exe'

alias baidu='~/.bashOoO/back2yun/backup2yun.php'
alias byun='python ~/.bypy/bypy.py'

alias ct='~/.bashOoO/changeTerminalColour.sh'

# indent for asterisk doxgen
alias indent='indent -i4 -ts4 -br -brs -cdw -lp -ce -nbfda -npcs -nprs -npsl -nbbo -saf -sai -saw -cs -l90'
# -i4:    indent level 4
#-ts4:   tab size 4
#-br:    braces on if line
#-brs:   braces on struct decl line
#-cdw:   cuddle do while
#-lp:    line up continuation below parenthesis
#-ce:    cuddle else
#-nbfda: dont break function decl args
#-npcs:  no space after function call names
#-nprs:  no space after parentheses
#-npsl:  dont break procedure type
#-saf:   space after for
#-sai:   space after if
#-saw:   space after while
#-cs:    space after cast
#-l90:  line length 90 columns


# change GateWay quickly for speedding up
alias cgdown='sudo sed -i 's/139.190/139.254/' /etc/NetworkManager/system-connections/Sict && sudo service network-manager restart'

alias cgup='sudo sed -i 's/139.254/139.190/' /etc/NetworkManager/system-connections/Sict && sudo service network-manager restart'

alias wikisole='~/.bashOoO/wikisole.sh'
