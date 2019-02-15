#sh for syntax highlighting in Code

#########################################
# Why did node fail???
==> Upgrading 1 outdated package:
node 11.9.0 -> 11.10.0
==> Upgrading node 
==> Downloading https://homebrew.bintray.com/bottles/node-11.10.0.mojave.bottle.tar.gz
==> Pouring node-11.10.0.mojave.bottle.tar.gz
Warning: The post-install step did not complete successfully
Error: Could not remove /usr/local/Cellar/node/11.8.0! Check its permissions.
You can try again using `brew postinstall node`
==> Caveats
Bash completion has been installed to:
  /usr/local/etc/bash_completion.d
==> Summary
🍺  /usr/local/Cellar/node/11.10.0: 4,417 files, 50MB
Removing: /usr/local/Cellar/node/11.8.0... (4,049 files, 17.9MB)
Removing: /usr/local/Cellar/node/11.9.0... (4,064 files, 48.6MB)
Removing: /Users/Eric/Library/Caches/Homebrew/node--11.9.0.tar.gz... (45.3MB)
Removing: /Users/Eric/Library/Caches/Homebrew/node--npm--6.5.0.tgz... (4.5MB)
Installing node has failed!
#########################################

# It seems there is already an App
==> Downloading https://www.dropbox.com/download?plat=mac&full=1
==> Downloading from https://clientupdates.dropboxstatic.com/dbx-releng/client/Dropbox%2066.4.84.dmg
==> No SHA-256 checksum defined for Cask 'dropbox', skipping verification.
==> Installing Cask dropbox
Error: It seems there is already an App at '/Applications/Dropbox.app'.
==> Purging files for version latest of Cask dropbox
Installing dropbox has failed!

# It seems there is already an App
==> Satisfying dependencies
==> Downloading https://download-installer.cdn.mozilla.net/pub/firefox/releases/65.0.1/mac/en-US/Firefox%2065.0.1.dmg
==> Verifying SHA-256 checksum for Cask 'firefox'.
==> Installing Cask firefox
Error: It seems there is already an App at '/Applications/Firefox.app'.
==> Purging files for version 65.0.1 of Cask firefox
Installing firefox has failed!

# It seems there is already an App
==> Satisfying dependencies
==> Downloading https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
==> Verifying SHA-256 checksum for Cask 'google-chrome'.
==> Installing Cask google-chrome
Error: It seems there is already an App at '/Applications/Google Chrome.app'.
==> Purging files for version 72.0.3626.109 of Cask google-chrome
Installing google-chrome has failed!

# It seems there is already an App
==> Satisfying dependencies
==> Downloading https://download.sublimetext.com/Sublime%20Text%20Build%203176.dmg
==> Verifying SHA-256 checksum for Cask 'sublime-text'.
==> Installing Cask sublime-text
Error: It seems there is already an App at '/Applications/Sublime Text.app'.
==> Purging files for version 3.176 of Cask sublime-text
Installing sublime-text has failed!

#### Overall
Homebrew Bundle failed! 5 Brewfile dependencies failed to install.
========> Brewfile installation failed
