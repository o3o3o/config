#!/bin/bash
set -o nounset
set -o errexit

install_dotfile(){
    dotfile="
    .bash_aliases
    .bashOoO
    .emacs
    .profile
    .tmux
    .tmux.conf
    .vimrc
    .xmodmaprc
    .zshrc
    "
    \cp -fr "$dotfile" ~/
}

install_stardic(){
    DIC_DIR=/usr/share/stardict/dic/

    mkdir -p $DIC_DIR
    cp -r dic/* $DIC_DIR
}
install_zsh(){
    cd ~/ && git clone https://github.com/robbyrussell/oh-my-zsh.git
}
install_zsh
install_dotfile
install_stardic

