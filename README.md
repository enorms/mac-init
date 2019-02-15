# mac-init
More than a dotfile to save preferences, a one-command full environment setup.

## Usage

On a fresh macOS:
* Setup for a software development environment entirely with a one-liner

```
curl --silent https://raw.githubusercontent.com/lifekaizen/mac-init/master/setup-mac-os.sh | bash
```

* Open a Fish shell and execute `compile_vim_plugins` and `install_oh_my_fish` functions.
* Enter license information of purchased applications.
* Manually set [un-automatable shortcuts](https://github.com/Sajjadhosn/dotfiles/blob/master/shortcuts/shortcuts.md#un-automatable-shortcuts)

Execute `bootstrap` function freely which in turn executes the bootstrapping script.


## TODO
store basic dotfiles
choose brew and cask install applications and dev environments

## Reference

[mac os empire article](https://medium.com/@Sajjadhosn/build-a-macos-empire-a0c83879ac24)

[corresponding repo](https://github.com/Sajjadhosn/dotfiles/)

[flush out decision space](https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/)
