# run to switch config files to repo
# ln -s ~/dev_local/mac-init/dot_config/.zshrc ~/.zshrc

# set options
# https://gist.github.com/Anon-Exploiter/4e12193df0099183d18720c6471d571a
# https://github.com/camillobruni/script/blob/master/zshrc
# https://scriptingosx.com/2019/06/moving-to-zsh-part-3-shell-options/
# ctr + u: kill line
# ctr + w: kill word
# add 'ctr + del' by setting Teminal > Settings > Keyboard: + '\027'
# fake_bindkey 'ctr + del' backward-kill-word
setopt interactivecomments # allow comments in interactive mode
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^[[1;5C' forward-word                    # opt + ->
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down

# aliases
source $HOME/dev_local/mac-init/dot_config/.aliases
source $HOME/dev_local/mac-init/dot_config/functions/*

# local scripts
export PATH=$PATH":$HOME/dev_local/scripts"
export PATH=$PATH":$HOME/dev_local/scripts/rachleff-list/src"
export PATH=$PATH":$HOME/dev_local/scripts/rachleff-list/"
export PATH=$PATH":$HOME/dev_local/mac-init/"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# don't use conda by default
export PATH="/usr/local/bin/python3:$PATH"

# /usr/local/bin/gcc-6 not working
export PATH="/usr/local/bin/gcc-6:$PATH"

# esp-idf
export IDF_PATH=/Users/eric/dev_local/github/product_jump/bridge/esp/esp-idf
export PATH="$IDF_PATH/tools:$PATH"

# /usr/local/bin/gcc-6 not working
export PATH="/usr/local/bin/gcc-6:$PATH"

# Wasp-lang
# https://wasp-lang.dev/docs#2-installation
export PATH=$PATH:/Users/eric/.local/bin

# brew
eval "$(/opt/homebrew/bin/brew shellenv)"
# brew doctor
export PATH="/usr/local/sbin:$PATH"

#node
export PATH="/usr/local/bin/node:$PATH"export 
PATH="/usr/local/opt/node@14/bin:$PATH"
PATH="/usr/local/opt/node@16/bin:$PATH"
PATH="/usr/local/opt/node@18/bin:$PATH"

# ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"


# gpg, sign commits github
GPG_TTY=$(tty)
export GPG_TTY

# ensure shell looks in current dir for commands
export PATH=".:$PATH"

# Python versions
## pyenv
# eval "$(pyenv init -)"
# PATH=$(pyenv root)/shims:$PATH
# # 
# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
## homebrew
# export PATH="/usr/local/opt/python@3.10/bin:$PATH"


# bun completions
[ -s "/Users/e/.bun/_bun" ] && source "/Users/e/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/node@18/bin:$PATH"
