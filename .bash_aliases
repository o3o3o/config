alias f='fortune'

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
alias cherrytree='export LANG=en_US.UTF-8;export LC_ALL=en_US.UTF-8;cherrytree'

function tags_django()
{
    ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags 

}
function tags_js()
{
    ctags -R --fields=+l  --languages=javascript
    #javascript-ctags
}

function tags_django_full()
{
    ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))")

}

function pyclean()
{
    find . -name '*.pyc' | xargs rm
    echo "Clean .pyc Finished"
}

function pyenvinstall()
{
    local v=$1
    # local v=3.6.5
    wget -c http://mirrors.sohu.com/python/${v}/Python-${v}.tar.xz -P ~/.pyenv/cache/
    pyenv install ${v}
}

transfer() {
    # write to output to tmpfile because of progress bar
    tmpfile=$( mktemp -t transferXXX )
        curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) >> $tmpfile;
    cat $tmpfile;
    rm -f $tmpfile;
}

batch_add_sourcerer() {
    for i in $@
    do
        sourcerer add $i
    done
}

unset_proxy() {
    unset {http,https,ftp}_proxy
    unset {HTTP,HTTPS,FTP}_PROXY
}

set_proxy() {
    export {http,https,ftp}_proxy="$1"
    export {HTTP,HTTPS,FTP}_PROXY="$1"
}

alias cgp1="set_proxy http://127.0.0.1:1087"
alias cgp2="set_proxy http://127.0.0.1:51086"
alias rp="unset_proxy"

alias dlog='docker logs -t 50  -f'
alias cleos='cleos --print-request --print-response'

#alias dcm='docker-compose'
alias pipenv='pipenv --pypi-mirror https://mirrors.aliyun.com/pypi/simple/'
alias tox='tox -i https://mirrors.aliyun.com/pypi/simple/'
alias fix_readlib='cd /usr/local/opt/readline/lib && ln -s libreadline.8.0.dylib libreadline.7.dylib && cd -'

listening() {
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
gitime() {
    author=$1
    if [ $# -eq 0 ]; then
        echo "Author: all"
    else
        echo "Author: $1"
    fi
    echo "--------------------"
    git log --author="${author}" --format="%ad" --date="format:%H"|awk '{n=$1+0;if(H[n]++>max)max=H[n]}END{for(i=0;i<24;i++){printf"%02d -%5d ",i,H[i];for(n=0;n<H[i]/max*50;n++){printf "*"}print""}}'
}
