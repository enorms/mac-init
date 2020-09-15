# for react native (or flutter) Android dev
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# For Latex
export PATH=/usr/local/texlive/2018/bin:$PATH
export PATH=/usr/local/texlive/2018/bin/x86_64-darwin/xelatex:$PATH
export PATH=/usr/local/texlive/2018/bin/x86_64-darwin:$PATH

export PATH=/Users/eric/dev_local_mbp/pdf:$PATH

# Caveats > mono >To use the assemblies from other formulae you need to set:
export MONO_GAC_PREFIX="/usr/local"

# Aliases
# allow xcode to open the current folder in command line
alias xcode='open -a xcode .'
# run this without having to drop in the file path
alias maintain='/Users/eric/dev_local/github/mac-init/maintain.sh'
# who uses python 2
alias python='python3'
alias py='python3'
alias pip='pip3'

# use brewfile in git repo # default is ~/.config/brewfile/Brewfile
export HOMEBREW_BREWFILE=~/dev_local/github/mac-init/homebrew/.Brewfile
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_INSTALL_BADGE=⛷✨