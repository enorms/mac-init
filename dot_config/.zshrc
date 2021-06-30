# last updated: 2021-05-14

# aliases
$HOME/dev_local/github/mac-init/dot_config/.aliases

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

# /usr/local/bin/gcc-6 not working
export PATH="/usr/local/bin/gcc-6:$PATH"

# esp-idf
export IDF_PATH=/Users/eric/dev_local/github/product_jump/bridge/esp/esp-idf
export PATH="$IDF_PATH/tools:$PATH"

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# set options
# https://gist.github.com/Anon-Exploiter/4e12193df0099183d18720c6471d571a
# https://github.com/camillobruni/script/blob/master/zshrc
# https://scriptingosx.com/2019/06/moving-to-zsh-part-3-shell-options/
setopt interactivecomments # allow comments in interactive mode
bindkey ' ' magic-space                           # do history expansion on space
bindkey '^[[1;5C' forward-word                    # ctrl + ->
bindkey '^[[C' forward-word                       # ctrl + ->
bindkey '^[[1;5D' backward-word                   # ctrl + <-
bindkey '^[[D' backward-word                      # ctrl + <-
bindkey '^[[5~' beginning-of-buffer-or-history    # page up
bindkey '^[[6~' end-of-buffer-or-history          # page down
bindkey '^[[Z' undo                               # shift + tab undo last action