# mac-init

Full environment with preferences and installed software for initial install and on-going sync between devices.

# Usage - Initial

Install XCode and accept license, via app store

Install XCode CLT
`xcode-select --install`

Download latest setup file and run.

```SHELL
curl --silent https://raw.githubusercontent.com/lifekaizen/mac-init/master/setup-mac-os.sh | bash
```

Link gitconfig.
`ln -s ~/dev_local/mac-init/dot_config/.gitconfig ~/.gitconfig`

- Enter license information of purchased applications.
- Manually set [un-automatable shortcuts](https://github.com/Sajjadhosn/dotfiles/blob/master/shortcuts/shortcuts.md#un-automatable-shortcuts)

Execute `bootstrap` function freely which in turn executes the bootstrapping script.

## Modifications after install

### Anaconda

Update path
`export PATH=/usr/local/anaconda3/bin:$PATH`

To run:
`source /usr/local/anaconda3/bin/activate`

### Android Tools:

Update path

```sh
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
```

### Lyx

Update path

```sh
export PATH=/usr/local/texlive/2018/bin:$PATH
export PATH=/usr/local/texlive/2018/bin/x86_64-darwin/xelatex:$PATH
export PATH=/usr/local/texlive/2018/bin/x86_64-darwin:$PATH
export PATH=/usr/local/texlive/2018/texmf-dist/tex/latex:$PATH
export PATH=/usr/local/texlive/2018/texmf-dist/tex/:$PATH
```

# Usage - Maintain

## Applications

Save all installed:

```sh
brew bundle dump --all --describe --file=Brewfile

```

Check for missing applications:

```sh
brew bundle check -v --all --file={PATH}
```

Remove unneeded applications

`brew bundle cleanup --force --file=[path]`

Check for outdated and upgrade:

```sh
brew outdated
brew upgrade
```

# Extra

## TODO

store basic dotfiles

choose brew and cask install applications and dev environments

Check missing packages: `brew list --cask`
May need to be in dir with Brewfile

## Reference

[mac os empire article](https://medium.com/@Sajjadhosn/build-a-macos-empire-a0c83879ac24)

[corresponding repo](https://github.com/Sajjadhosn/dotfiles/)

[flush out decision space](https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/)

# TODO: link ~/.config/karabiner/assets/\*

# TODO .gitconfig > signingkey
