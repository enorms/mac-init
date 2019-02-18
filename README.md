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

## Modifications after install

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

## TODO
store basic dotfiles

choose brew and cask install applications and dev environments

###brew packages:
autoconf
automake
cloudfoundry/tap/cf-cli
cmake
gcc
gdbm
gmp	
gnutls
hwloc
icu4c
isl
libffi
libgcrypt
libgpg-error
libimobiledevice
libmicrohttpd
libmpc
libplist
libtasn1
libtool
libunistring
libusb
libxml2
libzip
mongodb	// optional
mpfr
nettle
openssl
p11-kit
pcre
pkg-config
python
python@2
readline
sphinx-doc
sqlite
usbmuxd
xz	// unknown


#### react-native:
watchman
yarn
ideviceinstaller
ios-deploy
node

#### flutter:
dart

#### docker:
docker
kubernetes-cli
kubernetes-helm

###cask apps:

* android-platform-tools	//adb
* macdown

When complete, the above should show in `brew cask list`.

## Reference

[mac os empire article](https://medium.com/@Sajjadhosn/build-a-macos-empire-a0c83879ac24)

[corresponding repo](https://github.com/Sajjadhosn/dotfiles/)

[flush out decision space](https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/)
