#!/bin/bash
set -o nounset
set -o errexit

install_dotfile(){
    local dotfile="
    .bash_aliases
    .tmux.conf
    .vimrc
    .zshrc
    "
    for i in $dotfile
    do
        \cp -fr $i ~/
    done

}

install_ohmyzsh(){
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

install_tpm(){
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    tmux source-file ~/.tmux.conf
    echo "Enter tmux and hit prefix + I to fetch all the plugin"
}

install_apt(){
    sudo apt-get install docker docker-compose tmux zsh
}

case $1 in 
    apt)
        install_apt
        ;;
    zshconf)
        install_ohmyzsh
        ;;
    tpm)
        install_tpm
        ;;
    dots)
        install_dotfile
        ;;
    *)
        install_apt
        install_ohmyzsh
        install_dotfile
esac
