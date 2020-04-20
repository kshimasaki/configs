# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt autocd
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/c0ldest/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

### PATH ###
if [ -d "/home/c0ldest/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
    export ERL_LIBS="$HOME/repos/nifty/_build/default/lib:$HOME/repos/nifty/_build/default/plugins"
fi

### FIXES ###
# Fix left/right + ctrl
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

### CUSTOM ALIASES ###
alias md="mkdir"
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias lal="ls -al"


### ZPLUG ###
source ~/.zplug/init.zsh

# OMZ colored-man-pages
zplug "plugins/colored-man-pages", from:oh-my-zsh

# OMZ colorize - disabled pending pygments.org install
#zplug "plugins/colorize", from:oh-my-zsh

# OMZ cp - secure copy command cpv that uses rsync
zplug "plugins/cp", from:oh-my-zsh

# OMZ extract - selects the correct command to extract the archive
zplug "plugins/extract", from:oh-my-zsh

# OMZ git - adds aliases for git https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git
zplug "plugins/git", from:oh-my-zsh

# OMZ ubuntu - adds aliases for ubuntu commands (apt, etc.)
zplug "plugins/ubuntu", from:oh-my-zsh

# OMZ common-aliases - adds aliases for common commands
zplug "plugins/common-aliases", from:oh-my-zsh

# Powerline9k theme install
zplug "bhilburn/powerlevel9k", as:theme

# Pure theme install
#zplug "mafredri/zsh-async", from:github
#zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# ls colorizing
alias ls="ls --color=auto"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load 

# Fix alias for Silver Searcher
alias ag="ag"

# Source virtualenvwrapper
source /etc/bash_completion.d/virtualenvwrapper

# OpenCV 4.1.0 pkg config stuff
PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
export PKG_CONFIG_PATH

# Tensorflow object-detection stuff
export PYTHONPATH=$PYTHONPATH:/home/c0ldest/repos/tensorflow/models/research:/home/c0ldest/repos/tensorflow/models/research/slim
