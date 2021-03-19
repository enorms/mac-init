
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

# run this without having to drop in the file path
alias maintain='/Users/eric/dev_local/github/mac-init/maintain.sh'

# allow xcode to open the current folder in command line
alias xcode='open -a xcode .'

# who uses python 2
alias python='python3'
alias py='python3'
alias pip='pip3'

# /usr/local/bin/gcc-6 not working
export PATH="/usr/local/bin/gcc-6:$PATH"

# esp-idf
export IDF_PATH=/Users/eric/dev_local/github/product_jump/bridge/esp/esp-idf
export PATH="$IDF_PATH/tools:$PATH"

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# use linux ll command
# https://unix.stackexchange.com/questions/28425/how-can-i-install-the-ll-command-on-mac-os-x
alias ll='ls -lG'
