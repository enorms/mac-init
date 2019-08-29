#!/usr/bin/env bash

### Set variables

# Set the local repo
REPO=~/github/mac-init/
BREW_FILE_PATH="${REPO}/brew/macOS.Brewfile"

# Update the packages wanted
pip3_packages=(numpy matplotlib pandas scipy seaborn pylint rope pytest virtualenv anaconda python-barcode python-dateutil)
yarn_packages=(json create-react-app)


### Define functions

main() {

    # Get master password
    ask_for_sudo

    # Install 'brew', 'cask', and 'mas' packages
    # To force remove anything not there, uncomment the following line
    remove_unlisted_bundle_items
    install_packages_with_brewfile

    # Update Homebrew
    update_homebrew

    # Update Cask
    update_cask

    # Update Mas
    update_mas

    # Install pip3 packages
    install_pip3_packages

    # Install yarn packages; used for react-native
    install_yarn_packages

    # Check if outstanding Apple system updates are available
    update_softwareupdate

}


function ask_for_sudo() {
    info "Prompting for sudo password"
    if sudo --validate; then
        # Keep-alive
        while true; do sudo --non-interactive true; \
            sleep 10; kill -0 "$$" || exit; done 2>/dev/null &
        success "Sudo password updated"
    else
        error "Sudo password update failed"
        exit 1
    fi
}

function remove_unlisted_bundle_items() {
    brew bundle cleanup --force -v --file="$BREW_FILE_PATH"
}


function install_packages_with_brewfile() {
    info "Installing packages within ${BREW_FILE_PATH}"
#    substep "List all dependencies: "
#    brew bundle list --all --file="$BREW_FILE_PATH"

    # Use verbose mode
    if brew bundle check -v --file="$BREW_FILE_PATH" &> /dev/null; then
        success "Brewfile's dependencies are already satisfied "
    else
        if brew bundle -v --file="$BREW_FILE_PATH"; then
            success "Brewfile installation succeeded"
        else
            error "Brewfile installation failed"
            exit 1
        fi
    fi
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

function install_pip3_packages() {
    info "Installing pip packages \"${pip3_packages[*]}\""

    pip3_list_outcome=$(pip3 list)
    for package_to_install in "${pip_packages[@]}"
    do
        if echo "$pip3_list_outcome" | \
            grep --ignore-case "$package_to_install" &> /dev/null; then
            substep "\"${package_to_install}\" already exists"
        else
            if pip3 install "$package_to_install"; then
                substep "Package \"${package_to_install}\" installation succeeded"
            else
                error "Package \"${package_to_install}\" installation failed"
                exit 1
            fi
        fi
    done

    success "pip packages successfully installed"
}

function install_yarn_packages() {
    # json for auto-formatting of json responses in terminal
    info "Installing yarn packages \"${yarn_packages[*]}\""

    yarn_list_outcome=$(yarn global list)
    for package_to_install in "${yarn_packages[@]}"
    do
        if echo "$yarn_list_outcome" | \
            grep --ignore-case "$package_to_install" &> /dev/null; then
            substep "\"${package_to_install}\" already exists"
        else
            if yarn global add "$package_to_install"; then
                substep "Package \"${package_to_install}\" installation succeeded"
            else
                error "Package \"${package_to_install}\" installation failed"
                exit 1
            fi
        fi
    done

    success "yarn packages successfully installed"
}


### Add color to Terminal status prints

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


### Execute program

main "$@"
