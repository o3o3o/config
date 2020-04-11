alias ,f='fortune'

function ,tag ()
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
alias ,cherrytree='export LANG=en_US.UTF-8;export LC_ALL=en_US.UTF-8;cherrytree'

function ,tags_django()
{
    ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags 

}
function ,tags_js()
{
    ctags -R --fields=+l  --languages=javascript
    #javascript-ctags
}

function ,tags_django_full()
{
    ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))")

}

function ,pyclean()
{
    find . -name '*.pyc' | xargs rm
    echo "Clean .pyc Finished"
}

function ,pyenvinstall()
{
    local v=$1
    # local v=3.6.5
    wget -c http://mirrors.sohu.com/python/${v}/Python-${v}.tar.xz -P ~/.pyenv/cache/
    pyenv install ${v}
}

,transfer() {
    # write to output to tmpfile because of progress bar
    tmpfile=$( mktemp -t transferXXX )
        curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) >> $tmpfile;
    cat $tmpfile;
    rm -f $tmpfile;
}

,batch_add_sourcerer() {
    for i in $@
    do
        sourcerer add $i
    done
}

,clean_proxy() {
    unset {http,https,ftp}_proxy
    unset {HTTP,HTTPS,FTP}_PROXY
}

set_proxy() {
    export {http,https,ftp}_proxy="$1"
    export {HTTP,HTTPS,FTP}_PROXY="$1"
}

alias ,cgp1="set_proxy http://127.0.0.1:1087"
alias ,cgp2="set_proxy http://127.0.0.1:50186"
alias ,cgp3="set_proxy http://127.0.0.1:1081"

alias ,dlog='docker logs -t 50  -f'
alias ,cleos='cleos --print-request --print-response'

#alias dcm='docker-compose'
alias ,pipenv='pipenv --pypi-mirror https://mirrors.aliyun.com/pypi/simple/'
alias ,tox='tox -i https://mirrors.aliyun.com/pypi/simple/'
alias ,fix_readlib='cd /usr/local/opt/readline/lib && ln -s libreadline.8.0.dylib libreadline.7.dylib && cd -'

,show_listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}

# show author's git commit time
# forked from https://gist.github.com/bessarabov/674ea13c77fc8128f24b5e3f53b7f094
,gitime() {
    author=$1
    if [ $# -eq 0 ]; then
        echo "Author: all"
    else
        echo "Author: $1"
    fi
    echo "--------------------"
    git log --author="${author}" --format="%ad" --date="format:%H"|awk '{n=$1+0;if(H[n]++>max)max=H[n]}END{for(i=0;i<24;i++){printf"%02d -%5d ",i,H[i];for(n=0;n<H[i]/max*50;n++){printf "*"}print""}}'
}

alias ,copy='pbcopy'

,proxybrew() {
    set -ux 
    local BREW_GIT_DIR=$(brew --repo)
    local BREW_CORE_DIR="${BREW_GIT_DIR}/Library/Taps/homebrew/homebrew-core"

    local MIRROR_BREW_URL="https://mirrors.aliyun.com/homebrew/brew.git"
    local MIRROR_BREW_CORE_URL="https://mirrors.aliyun.com/homebrew/homebrew-core.git"
    # local MIRROR_BOTTLE_DOMAIN="https://mirrors.aliyun.com/homebrew/homebrew-bottles"

    if [ $# -gt 1 ] && [ "$1" -eq "restore" ]; then
        echo "Restore to default...."
        MIRROR_BREW_URL="https://github.com/Homebrew/brew.git"
        MIRROR_BREW_CORE_URL="https://github.com/Homebrew/homebrew-core.git"
        MIRROR_BOTTLE_DOMAIN=""
    else
        echo "Set mirrors into ${MIRROR_BREW_URL}"
    fi

    cd ${BREW_GIT_DIR} && git remote set-url origin ${MIRROR_BREW_URL}
    cd ${BREW_CORE_DIR} && git remote set-url origin ${MIRROR_BREW_CORE_URL}

    ## add or update a line
    # gsed "/^HOMEBREW_BOTTLE_DOMAIN=/{h;s/=.*/=${MIRROR_BOTTLE_DOMAIN}/};\${x;/^$/{s//HOMEBREW_BOTTLE_DOMAIN=${MIRROR_BOTTLE_DOMAIN}/;H};x}" ~/.zshenv
    # gsed "~^HOMEBREW_BOTTLE_DOMAIN=~{h;s~=.*~=${MIRROR_BOTTLE_DOMAIN}~};\${x;~^$~{s~~HOMEBREW_BOTTLE_DOMAIN=${MIRROR_BOTTLE_DOMAIN}~;H};x}" ~/.zshenv
    # gsed ",^HOMEBREW_BOTTLE_DOMAIN=,{h;s,=.*,=${MIRROR_BOTTLE_DOMAIN},};\${x;,^$,{s,,HOMEBREW_BOTTLE_DOMAIN=${MIRROR_BOTTLE_DOMAIN},;H};x}" ~/.zshenv
    # source ~/.zshenv
}
alias ,brew="HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles brew $@"

alias ,sync_time="sudo sntp -sS pool.ntp.org"
alias ,tmuxr='tmux new -d -s delete-me && tmux run-shell ~/.tmux/plugins/tmux-resurrect/scripts/restore.sh && tmux kill-session -t delete-me && tmux attach || tmux attach'
