#!/bin/bash
set -o nounset
set -o errexit

install_dotfile(){
    local dotfile="
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
    for i in $dotfile
    do
        \cp -fr $i ~/
    done

}

install_stardic(){
    DIC_DIR=/usr/share/stardict/dic/

    mkdir -p $DIC_DIR
    cp -r dic/* $DIC_DIR
}
install_zsh(){
    pushd .
    cd ~/ && git clone https://github.com/robbyrussell/oh-my-zsh.git  && cd ~/oh-my-zsh/ && ./tools/install.sh
    && cd -
    popd .
}

install_vim(){
    # https://github.com/VundleVim/Vundle.vim
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo "Please execute :BundleInstall in vim"
}

install_tmux(){
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    tmux source-file ~/.tmux.conf
    echo "Please install plugin with 'prefix + I' in tmux session"
}
install_zsh
install_dotfile
install_stardic
install_vim
install_tmux

