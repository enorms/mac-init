export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH=/usr/local/texlive/2018/bin:$PATH
export PATH=/usr/local/texlive/2018/bin/x86_64-darwin/xelatex:$PATH
export PATH=/usr/local/texlive/2018/bin/x86_64-darwin:$PATH


# current stable Ruby
# https://jekyllrb.com/docs/installation/macos/ 
# moves from: /usr/bin/ruby ruby 2.6.3p62 (2019-04-16 revision 67580) [universal.x86_64-darwin19]
# to: /usr/local/opt/ruby/bin/ruby ruby 2.6.5p114 (2019-10-01 revision 67812) [x86_64-darwin19]
# export PATH=/usr/local/opt/ruby/bin:$PATH # ruby to install jekyll gem
# export PATH=$HOME/.gem/ruby/2.6.0/bin:$PATH # for jekyll, with the first two digits of your Ruby version (ruby -v)

# above didn't work for jekyll (ghp instructions), trying this from jekyll site
export PATH=/usr/local/bin:$PATH

# use brewfile in git repo # default is ~/.config/brewfile/Brewfile
export HOMEBREW_BREWFILE=~/dev_local/github/mac-init/homebrew/.Brewfile
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_INSTALL_BADGE=⛷✨


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
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

