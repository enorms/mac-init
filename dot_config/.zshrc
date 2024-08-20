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

# don't use conda by default
export PATH="/usr/local/bin/python3:$PATH"

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

# Created by `pipx` on 2024-05-10 20:50:54
export PATH="$PATH:/Users/e/.local/bin"
