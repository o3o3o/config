
alias cp='cp -i'
alias d='dirs -v'
alias sl='sl -e'
alias SL='sl -e'
alias booklist='~/.bashOoO/booklist.sh'
alias Rdesktop='~/.bashOoO/Rdesktop.sh'
alias MySql='~/.bashOoO/MySql.sh'
alias backup2183='~/.bashOoO/backup2183.sh'
#OoO_IP=$(hamachi list|grep michael_OoO|awk '{ print $4 }'|uniq)
alias bk2OoO='~/.bashOoO/backup2OoO.sh -h ${OoO_IP}'

alias t='todo'
alias ta='todo all'
alias f='fortune'
alias W='~/.bashOoO/weather.sh'
alias dict='~/.bashOoO/dict.sh'
alias say='~/.bashOoO/say.sh'
alias dropboxd='~/.dropbox-dist/dropboxd'
alias fgw='/opt/longene/qq2012/wine/bin/wine ~/.bashOoO/fg742p.exe'

alias baidu='~/.bashOoO/back2yun/backup2yun.php'
alias byun='python ~/.bypy/bypy.py'

alias ct='~/.bashOoO/changeTerminalColour.sh'
alias cp2ftp='~/.bashOoO/cp2ftp.sh'

# indent for asterisk doxgen
#alias indent='indent -i4 -ts4 -br -brs -cdw -lp -ce -nbfda -npcs -nprs -npsl -nbbo -saf -sai -saw -cs -l90'
alias indent='indent -i4 -ts4 -br -brs -cdw -lp -ce -nbfda -npcs -nprs -npsl -nbbo'
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


# change GateWay for speed
alias cgdown='sudo sed -i 's/139.200/139.254/' /etc/NetworkManager/system-connections/Sict && sudo service network-manager restart'

alias cgup='sudo sed -i 's/139.254/139.200/' /etc/NetworkManager/system-connections/Sict && sudo service network-manager restart'

alias wikisole='~/.bashOoO/wikisole.sh'
alias xmod='xmodmap ~/.xmodmaprc'
alias psg='ps aux|grep'
alias pkillqq='pkill QQ; pkill TM; pkill wine; pkill TXPlatform.exe'

#new tab with title
# args <IP> <TITLE>
function sshtitle(){
    local ip=$1
    local title=$2
    xfce4-terminal --tab -T "$title" -e "ssh -p2222 -vl root $ip"
}

# aliyun_ip aws_ip in /etc/hosts
alias ssh2aliyun='sshtitle aliyun_ip aliyun'
alias ssh2aws='sshtitle aws_ip aws'

function 139_ssh(){
    local port=$1
    if [ "$port" != "" ];then 
        sshtitle "192.168.139.$port" "local-$port"
    fi
}
alias ssh2local='139_ssh'
alias markdown='~/.markdown/linux32/CmdMarkdown'
alias k='~/.bashOoO/key_change.sh'

function tag ()
{
#clean older info
    rm -rf tags
    rm -rf cscope.files
    rm -rf cscope.out
# generate new info
    find $PWD | egrep -i "\.(c|h|cpp|php)$" > cscope.files
    ctags -R . --tag-relative=yes ./
cscope -qRb
}
