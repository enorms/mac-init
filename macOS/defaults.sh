#!/usr/bin/env zsh
  

###########################################################################################
#
# Example to look at one value:
#   Check:
#     % defaults read NSGlobalDomain AppleShowScrollBars
#     Always
#
#     or 
#     % defaults find brave |head
#     Found 13 keys in domain 'com.brave.Browser': {
#         LastRunAppBundlePath = "/Applications/Brave Browser.app";
#         NSNavLastRootDirectory = "~/Downloads";
#         NSNavLastUserSetHideExtensionButtonState = 1;
#         NSNavPanelExpandedSizeForOpenMode = "{800, 448}";
#         NSNavPanelExpandedSizeForSaveMode = "{800, 448}";
#         NSNavPanelExpandedStateForSaveMode = 1;
#         "NSWindow Frame NSNavPanelAutosaveName" = "880 745 800 388 0 0 2560 1415 ";
#         SUAutomaticallyUpdate = 1;
#         SUEnableAutomaticChecks = 1;
# 
#   Set:
#     defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# 
# 
# References
# https://github.com/mathiasbynens/dotfiles/blob/main/.macos
# https://www.learningosx.com/101-ways-to-tweak-os-x-using-terminal/
# https://www.cnet.com/news/check-defaults-before-altering-hidden-settings-in-os-x/
# https://superuser.com/questions/427154/reset-mac-os-x-terminal-to-default/448679
#
#
###########################################################################################


main() {

#    configure_plist_apps
    configure_mac
}

function configure_plist_apps() {

    ## Not configured yet
    return
}

function configure_mac() {

    # Close any open System Preferences panes, to prevent them from overriding
    # settings we’re about to change
    osascript -e 'tell application "System Preferences" to quit'

    ## Disable Gatekeeper for getting rid of unknown developers error
    sudo spctl --master-disable

    # Keep-alive: update existing `sudo` time stamp until `.macos` has finished
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


    ##############################################################################
    # Security                                                                   #
    ##############################################################################
    # More options here: https://github.com/atomantic/dotfiles/blob/master/install.sh
    # Based on:
    # https://github.com/drduh/macOS-Security-and-Privacy-Guide
    # https://benchmarks.cisecurity.org/tools2/osx/CIS_Apple_OSX_10.12_Benchmark_v1.0.0.pdf

    # Enable firewall. Possible values:
    #   0 = off
    #   1 = on for specific sevices
    #   2 = on for essential services
    sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1

    # Enable firewall stealth mode (no response to ICMP / ping requests)
    # Source: https://support.apple.com/kb/PH18642
    sudo defaults write /Library/Preferences/com.apple.alf stealthenabled -int 1

    ###############################################################################
    # For coding                                                                  #
    ###############################################################################

    # Disable automatic capitalization as it’s annoying when typing code
    defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

    # Disable smart dashes as they’re annoying when typing code
    defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

    # Disable automatic period substitution as it’s annoying when typing code
    defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

    # Disable smart quotes as they’re annoying when typing code
    defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

    # Display ASCII control characters using caret notation in standard text views
    # Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
    defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

    ###############################################################################
    # General UI/UX                                                               #
    ###############################################################################

    ## Enable tap to click
    defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

    ## Configure keyboard repeat https://apple.stackexchange.com/a/83923/200178
    defaults write -g InitialKeyRepeat -int 30 # normal minimum is 15 (225 ms)
    defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

    ## Disable "Correct spelling automatically"
    defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

    quit "Dock"

    ## Don’t show recent applications in Dock
    # defaults write com.apple.dock show-recents -bool false

    ## Set a smaller icon size of Dock items
    defaults write com.apple.dock tilesize -int 40

    ## Remove all (default) app icons from the Dock
    # defaults write com.apple.dock persistent-apps -array
    # defaults write com.apple.dock recent-apps -array

    ## Show only open applications in the Dock
    # defaults write com.apple.dock static-only -bool true

    ## Don’t animate opening applications from the Dock
    defaults write com.apple.dock launchanim -bool false

    ## Disable Dashboard
    defaults write com.apple.dashboard mcx-disabled -bool true

    ## Don’t show Dashboard as a Space
    defaults write com.apple.dock dashboard-in-overlay -bool true

    # Disable the Launchpad gesture (pinch with thumb and three fingers)
    defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

  
    ## Hot corners
    # Possible values:
    #  0: no-op
    #  2: Mission Control
    #  3: Show application windows
    #  4: Desktop
    #  5: Start screen saver
    #  6: Disable screen saver
    #  7: Dashboard
    # 10: Put display to sleep
    # 11: Launchpad
    # 12: Notification Center
    # Top left screen corner
    defaults write com.apple.dock wvous-tl-corner -int 0
    defaults write com.apple.dock wvous-tl-modifier -int 0
    ## Top right screen corner
    defaults write com.apple.dock wvous-tr-corner -int 0
    defaults write com.apple.dock wvous-tr-modifier -int 0
    ## Bottom left screen corner
    defaults write com.apple.dock wvous-bl-corner -int 0
    defaults write com.apple.dock wvous-bl-modifier -int 0


    open "Dock"


    ## Save screenshots to Downloads folder
    defaults write com.apple.screencapture location -string "${HOME}/Downloads"

    ## Require password immediately after sleep or screen saver begins
    defaults write com.apple.screensaver askForPassword -int 1
     defaults write com.apple.screensaver askForPasswordDelay -int 0

    ## allow quitting via ⌘ + q; doing so will also hide desktop icons
    defaults write com.apple.finder QuitMenuItem -bool true

    # disable window animations and Get Info animations
    defaults write com.apple.finder DisableAllAnimations -bool true

    # Set Downloads as the default location for new Finder windows
    defaults write com.apple.finder NewWindowTarget -string "PfLo"
    defaults write com.apple.finder NewWindowTargetPath -string \
        "file://${HOME}/Downloads/"

    ## Enable/Disable Path Bar on bottom of Finder windows
    defaults write com.apple.finder ShowPathbar -bool true

    ## Display full POSIX path as Finder window title
    defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

    ## Keep folders on top when sorting by name
    defaults write com.apple.finder _FXSortFoldersFirst -bool true

    ## When performing a search, search the current folder by default
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

    ## Use list view in all Finder windows by default
    ## options: icnv, clmv, Flwv, Nlsv
    defaults write com.apple.finder FXPreferredViewStyle -string clmv
    
    # Always show scrollbars
    # Possible values: `WhenScrolling`, `Automatic` and `Always`
    defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
    
    # Save to disk (not to iCloud) by default
    defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
    
    # Automatically quit printer app once the print jobs complete
    defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

    # Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
    sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName
    
    # Restart automatically if the computer freezes
    sudo systemsetup -setrestartfreeze on

    # Avoid creating .DS_Store files on network or USB volumes
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
    defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

    # Show the ~/Library folder
    chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library

    # Expand save panel by default
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
    defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

    # Expand print panel by default
    defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
    defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

    # Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
    /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user



    ###############################################################################
    # Application Specific                                                        #
    ###############################################################################

    ## Google Chrome & Brave
    # Disable the all too sensitive backswipe on trackpads
    defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
    defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false
    defaults write com.brave.Browser AppleEnableSwipeNavigateWithScrolls -bool false
    defaults write com.brave.Browser.beta AppleEnableSwipeNavigateWithScrolls -bool false

    # Disable the all too sensitive backswipe on Magic Mouse
    defaults write com.google.Chrome AppleEnableMouseSwipeNavigateWithScrolls -bool false
    defaults write com.google.Chrome.canary AppleEnableMouseSwipeNavigateWithScrolls -bool false
    defaults write com.brave.Browser AppleEnableMouseSwipeNavigateWithScrolls -bool false
    defaults write com.brave.Browser.beta AppleEnableMouseSwipeNavigateWithScrolls -bool false

    # Use the system-native print preview dialog
    defaults write com.google.Chrome DisablePrintPreview -bool true
    defaults write com.google.Chrome.canary DisablePrintPreview -bool true
    defaults write com.brave.Browser DisablePrintPreview -bool true
    defaults write com.brave.Browser.beta DisablePrintPreview -bool true

    # Expand the print dialog by default
    defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
    defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true
    defaults write com.brave.Browser PMPrintingExpandedStateForPrint2 -bool true
    defaults write com.brave.Browser.beta PMPrintingExpandedStateForPrint2 -bool true
    
    ## SizeUp
    # Start SizeUp at login
    defaults write com.irradiatedsoftware.SizeUp StartAtLogin -bool true

    # Don’t show the preferences window on next start
    defaults write com.irradiatedsoftware.SizeUp ShowPrefsOnNextStart -bool false
    
    ## Mac App
    
    # Allow the App Store to reboot machine on macOS updates
    defaults write com.apple.commerce AutoUpdateRestartRequired -bool true

    # Enable the WebKit Developer Tools in the Mac App Store
    defaults write com.apple.appstore WebKitDeveloperExtras -bool true

    # Enable Debug Menu in the Mac App Store
    defaults write com.apple.appstore ShowDebugMenu -bool true

    # Enable the automatic update check
    defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

    # Check for software updates daily, not just once per week
    defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

    # Download newly available updates in background
    defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

    # Turn on app auto-update
    defaults write com.apple.commerce AutoUpdate -bool true

    ## Address Book, Dashboard, iCal, TextEdit, and Disk Utility

    # Enable the debug menu in Address Book
    defaults write com.apple.addressbook ABShowDebugMenu -bool true

    # Enable Dashboard dev mode (allows keeping widgets on the desktop)
    defaults write com.apple.dashboard devmode -bool true

    # Use plain text mode for new TextEdit documents
    defaults write com.apple.TextEdit RichText -int 0
    # Open and save files as UTF-8 in TextEdit
    defaults write com.apple.TextEdit PlainTextEncoding -int 4
    defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

    # Enable the debug menu in Disk Utility
    defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
    defaults write com.apple.DiskUtility advanced-image-options -bool true

    # Activity Monitor

    # Show the main window when launching Activity Monitor
    defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

    # Visualize CPU usage in the Activity Monitor Dock icon
    defaults write com.apple.ActivityMonitor IconType -int 5

    # Show all processes in Activity Monitor
    defaults write com.apple.ActivityMonitor ShowCategory -int 0

    # Sort Activity Monitor results by CPU usage
    defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
    defaults write com.apple.ActivityMonitor SortDirection -int 0
    
    ## Time Machine

    # Prevent Time Machine from prompting to use new hard drives as backup volume
    defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
    
    ## Terminal
    
    # Disable the annoying line marks (0)
    defaults write com.apple.Terminal ShowLineMarks -int 1

    # Only use UTF-8 in Terminal.app
    defaults write com.apple.terminal StringEncodings -array 4
    
    # Enable Secure Keyboard Entry in Terminal.app
    # See: https://security.stackexchange.com/a/47786/8918
    defaults write com.apple.terminal SecureKeyboardEntry -bool true




}

function quit() {
    app=$1
    killall "$app" > /dev/null 2>&1
}

function open() {
    app=$1
    osascript << EOM
tell application "$app" to activate
tell application "System Events" to tell process "iTerm2"
set frontmost to true
end tell
EOM
}

function import_plist() {
    domain=$1
    filename=$2
    defaults delete "$domain" &> /dev/null
    defaults import "$domain" "$filename"
}

main "$@"
