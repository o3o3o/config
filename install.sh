#!/bin/bash
set -o nounset

OPTIONS=(apt ohmyzsh tpm dotfile)

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

    mkdir -p ~/.pip
    cp .pip/pip.conf ~/.pip

}

install_ohmyzsh(){
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh )"
}

install_tpm(){
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    tmux source-file ~/.tmux.conf
    echo "Enter tmux and hit prefix + I to fetch all the plugin"
}

install_apt(){
    sudo apt-get install -y docker docker-compose tmux zsh
    sudo chsh -s $(grep /zsh$ /etc/shells | tail -1) $(whoami)
    sudo usermod -aG docker $(whoami)
    git config --global core.editor "vim"
    git config merge.tool vimdiff
    git config merge.conflictstyle diff3
    git config mergetool.prompt false
}

usage(){
cat <<EOF
Usage: $0 OPTIONS
          OPTIONS: all ${OPTIONS[@]}
EOF
}

main(){
    if [ $# -ne 1 ]; then
        echo $#
        usage
        exit 1
    fi

    if [[ " ${OPTIONS[@]} " =~ " $1 " ]]; then
        echo "install $1 ..."
        install_$1
    else
        for o in ${OPTIONS[@]}
        do
            echo "install $o"
            install_$o
        done
    fi
}

main $@
