#!/usr/bin/env bash

##### This script simply updates what is installed.
##### For changing what is installed, run the main installer.
##### That makes this safe to run anytime
##### and more likely to keep the main installer up to date.


# Set the local repo
REPO=~/github/mac-init/
BREW_FILE_PATH="${REPO}/brew/macOS.Brewfile"

# TODOs: use cli options for mac updates, esp XCode, and restarting
main() {
    get_sudo  # need for software update
    update_homebrew
    update_mas
    update_pip
    update_softwareupdate #  Apple system and apps
}

function get_sudo() {
    info "Sudo password"
    if sudo --validate; then
        # Keep-alive
        while true; do sudo --non-interactive true; \
            sleep 10; kill -0 "$$" || exit; done 2>/dev/null &
    else
        error "Fail get sudo password"
        exit 1
    fi
}

function update_homebrew() {
    info "Homebrew"
    brew outdated
    brew upgrade --display-times
}

function update_mas() {
    info "MAS"
    mas outdated
    mas upgrade
}

function update_softwareupdate() {
    info "Softwareupdate"
    sudo softwareupdate --install --recommended --restart #sudo needed to restart
}

function update_pip() {
    info "Pip packages"
    pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip3 install -U
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
