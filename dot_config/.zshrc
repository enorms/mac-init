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
