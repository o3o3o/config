#!/bin/bash
set -o nounset
set -o errexit

install_dotfile(){
    local dotfile="
    .bash_aliases
    .bashOoO
    .profile
    .tmux.conf
    .vimrc
    .zshrc
    "
    for i in $dotfile
    do
        \cp -fr $i ~/
    done

}

install_zsh(){
    pushd .
    cd ~/ && git clone https://github.com/robbyrussell/oh-my-zsh.git  && cd ~/oh-my-zsh/ && ./tools/install.sh
    && cd -
    popd .
}

sudo apt-get install docker docker-compose tmux zsh

install_zsh
install_dotfile
install_vim
