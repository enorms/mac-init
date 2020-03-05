#!/usr/bin/env bash

##### This script simply updates what is installed.
##### For changing what is installed, run the main installer.
##### That makes this safe to run anytime
##### and more likely to keep the main installer up to date.


# Set the local repo
REPO=~/github/mac-init/
BREW_FILE_PATH="${REPO}/brew/macOS.Brewfile"


main() {
    update_homebrew
    update_cask
    update_mas
    update_softwareupdate # Update Apple system software
}

function update_homebrew() {
    info "Homebrew update started."
    # substep "List packages: "
    # brew list
    substep "Check for updates... "
    brew update
    brew upgrade
    success "Homebrew update completed."
}

function update_cask() {
    info "Cask update started."
    # substep "List packages: "
    # brew cask list
    substep "Check for updates... "
    brew cask outdated
    brew cask upgrade
    success "Cask update completed."
}

function update_mas() {
    info "Mas update started."
    # substep "List packages: "
    # mas list
    substep "Check for updates... "
    mas outdated
    mas upgrade
    success "Mas update completed."
}

function update_softwareupdate() {
    info "Softwareupdate has started."
    substep "Check for updates... "
    # softwareupdate --list
    sudo softwareupdate --install --recommended --restart
    success "softwareupdate completed"
}


### Helper functions
function coloredEcho() {
    local exp="$1";
    local color="$2";
    local arrow="$3";
    if ! [[ $color =~ '^[0-9]$' ]] ; then
       case $(echo $color | tr '[:upper:]' '[:lower:]') in
        black) color=0 ;;
        red) color=1 ;;
        green) color=2 ;;
        yellow) color=3 ;;
        blue) color=4 ;;
        magenta) color=5 ;;
        cyan) color=6 ;;
        white|*) color=7 ;; # white or invalid color
       esac
    fi
    tput bold;
    tput setaf "$color";
    echo "$arrow $exp";
    tput sgr0;
}

function info() {
    coloredEcho "$1" blue "========>"
}

function substep() {
    coloredEcho "$1" magenta "===="
}

function success() {
    coloredEcho "$1" green "========>"
}

function error() {
    coloredEcho "$1" red "========>"
}


main "$@"
