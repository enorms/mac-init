# mac-init
More than a dotfile to save preferences, a one-command full environment setup.


## Usage

Install XCode and accept license.

```
curl --silent https://raw.githubusercontent.com/lifekaizen/mac-init/master/setup-mac-os.sh | bash
```

* Enter license information of purchased applications.
* Manually set [un-automatable shortcuts](https://github.com/Sajjadhosn/dotfiles/blob/master/shortcuts/shortcuts.md#un-automatable-shortcuts)

Execute `bootstrap` function freely which in turn executes the bootstrapping script.


## Modifications after install

### Update Path

# Anaconda

`export PATH=/usr/local/anaconda3/bin:$PATH`

# Android Tools:
``` SHELL
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

# Lyx
``` SHELL
export PATH=/usr/local/texlive/2018/bin:$PATH
export PATH=/usr/local/texlive/2018/bin/x86_64-darwin/xelatex:$PATH
export PATH=/usr/local/texlive/2018/bin/x86_64-darwin:$PATH
export PATH=/usr/local/texlive/2018/texmf-dist/tex/latex:$PATH
export PATH=/usr/local/texlive/2018/texmf-dist/tex/:$PATH
```


### To remove unneeded applications

If installed via brew, use brew bundle uninstall, like this:
`brew bundle cleanup --force --file=[path]`

Example:
```
erics-MacBook-Pro:mac-init eric$ brew bundle cleanup --force --file=/Users/eric/github/mac-init/brew/macOS.Brewfile
==> Uninstalling Cask resilio-sync
==> Backing App 'Resilio Sync.app' up to '/usr/local/Caskroom/resilio-sync/2.6.3/Resilio Sync.app'.
==> Removing App '/Applications/Resilio Sync.app'.
==> Purging files for version 2.6.3 of Cask resilio-sync
Uninstalled 1 cask
Pruned 1 symbolic links and 2 directories from /usr/local
```


## Usage notes

* Anaconda
To run:
`source /usr/local/anaconda3/bin/activate`


## TODO
store basic dotfiles

choose brew and cask install applications and dev environments


Check missing packages: `brew list --cask`
May need to be in dir with Brewfile



## Reference

[mac os empire article](https://medium.com/@Sajjadhosn/build-a-macos-empire-a0c83879ac24)

[corresponding repo](https://github.com/Sajjadhosn/dotfiles/)

[flush out decision space](https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/)
