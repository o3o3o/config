# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="gentoo"
#ZSH_THEME="gianu"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git tmux)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/home/michael/.rvm/gems/ruby-2.0.0-p451/bin:/home/michael/.rvm/gems/ruby-2.0.0-p451@global/bin:/home/michael/.rvm/rubies/ruby-2.0.0-p451/bin:/sbin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/sbin:/usr/sbin:/usr/local/bin:/usr/bin:/bin:/usr/games:/home/michael/.rvm/bin"
# export MANPATH="/usr/local/man:$MANPATH"
export PATH="$PATH:/Users/michael/work/arcanist/bin"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#
#set color for manpage
#export PAGER="`which less` -s"  
#export BROWSER="$PAGER"  
#export LESS_TERMCAP_mb=$'\E[01;36m'  
#export LESS_TERMCAP_md=$'\E[01;36m'  
#export LESS_TERMCAP_me=$'\E[0m'  
#export LESS_TERMCAP_se=$'\E[0m'  
#export LESS_TERMCAP_so=$'\E[01;44;33m'  
#export LESS_TERMCAP_ue=$'\E[0m'  
#export LESS_TERMCAP_us=$'\E[01;33m' 
#
#export LD_LIBRARY_PATH="/usr/local/lib:/usr/lib:$LD_LIBRARY_PATH"
#export PYTHONSTARTUP=~/.pythonrc

PATH="/Users/michael/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/michael/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/michael/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/michael/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/michael/perl5"; export PERL_MM_OPT;

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
#zstyle ':vcs_info:*' disable-patterns "$HOME/.oh-my-zsh(|/*) $HOME/Desktop/remote(|/*)"

#alias for cnpm
alias cnpm="npm --registry=https://registry.npm.taobao.org \
  --cache=$HOME/.npm/.cache/cnpm \
  --disturl=https://npm.taobao.org/dist \
  --userconfig=$HOME/.cnpmrc"
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
