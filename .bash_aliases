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

alias dlog='docker logs -t 50  -f'
alias cleos='cleos --print-request --print-response'

alias dcm='docker-compose'
