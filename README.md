# Install essential tools on a new ubuntu server

* zsh & [ohmyzsh](https://ohmyz.sh/)
* [tpm](https://github.com/tmux-plugins/tpm)
* dotfile: .vimrc, .tmux.conf, .bash_aliases, .zshrc
* use diff3 as the merge tool for vimdiff
* docker, docker-compose

# Usage:

```
./install.sh [all | apt | ohmyzsh | tpm | dotfile]
```

# FAQ

### Why my aliias start with `,`?
When you type `,tab tab`on CLI, you can only get your alias without mixing with other command names.
