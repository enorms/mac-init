#!/usr/bin/env bash

### Set variables

# adb - for Android
# anaconda - for iPython
# for work - numpy matplotlib pandas
# For MS VS Code: (lint, rename files) (pylint rope)
pip3_packages=(adb anaconda numpy matplotlib pandas pylint rope virtualenv)

# Installing typescript for YouCompleteMe and prettier for Neoformat to auto-format files
# json for auto-formatting of json responses in terminal
# vmd for previewing markdown files
yarn_packages=(prettier typescript json vmd create-react-app @vue/cli)

# failed on first try with: REPO=~/github/mac-init
# TODO: try adding mac-init.git
REPO=~/github/mac-init/

BREW_FILE_PATH="${REPO}/brew/macOS.Brewfile"
# BREW_FILE_PATH="${REPO}/brew/debug.Brewfile"    #debug


### Define functions

main() {

    # First things first, get master password
    ask_for_sudo

    # Install Homebrew
    install_homebrew

    # Cloning repository for install_packages_with_brewfile to have access to Brewfile
#    clone_repo

    # Install 'brew', 'cask', and 'mas' packages
    install_packages_with_brewfile

    # Remove quarantine from casks downloaded by brew
#    remove_quarantine

    # Install pip3 packages so that setup_symlinks can setup the symlinks
    install_pip3_packages

    # Install yarn packages; used for react-native
#    install_yarn_packages

    # Setting up symlinks so that setup_vim can install all plugins
    # NOT USING VIM OR POWERROOT
#    setup_symlinks

    # Update /etc/hosts
    # update_hosts_file # fails
        # ==== Copying /Users/Eric/dev_temp/mac-init/hosts/own_hosts_file to /etc/hosts succeeded
        # sudo: wget: command not found
        # ========> Failed to download hosts file
    
    # Set up macOS defaults
    setup_macOS_defaults

    # Update user Login Items
    update_login_items
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

function install_homebrew() {
    info "Installing Homebrew"
    if hash brew 2>/dev/null; then
        success "Homebrew already exists"
    else
url=https://raw.githubusercontent.com/lifekaizen/mac-init/master/installers/homebrew_installer
        if /usr/bin/ruby -e "$(curl -fsSL ${url})"; then
            success "Homebrew installation succeeded"
        else
            error "Homebrew installation failed"
            exit 1
        fi
    fi
}

function install_packages_with_brewfile() {
    info "Installing packages within ${BREW_FILE_PATH}"
    if brew bundle check --file="$BREW_FILE_PATH" &> /dev/null; then
        success "Brewfile's dependencies are already satisfied "
    else
        if brew bundle --file="$BREW_FILE_PATH"; then
            success "Brewfile installation succeeded"
        else
            error "Brewfile installation failed"
            exit 1
        fi
    fi
}

function remove_quarantine() {
    APPLICATIONS_PATH=/Applications
    info "Removing quarantine attributes from applications in ${APPLICATIONS_PATH}"
    sudo xattr -c /Applications/*.app &> /dev/null;
    success "Quarantine attributes from applications in ${APPLICATIONS_PATH} successfully removed"
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

function clone_repo() {
    info "Cloning dotfiles repository into ${REPO}"
    if test -e $REPO; then
        substep "${REPO} already exists"
        pull_latest $REPO
        success "Pull successful in ${REPO} repository"
    else
        url=https://github.com/lifekaizen/mac-init.git
        if git clone "$url" $REPO && \
           git remote set-url origin git@github.com:lifekaizen/mac-init.git; then
            success "Dotfiles repository cloned into ${REPO}"
        else
            error "Dotfiles repository cloning failed"
            exit 1
        fi
    fi
}

function pull_latest() {
    substep "Pulling latest changes in ${1} repository"
    if git -C $1 pull origin master &> /dev/null; then
        return
    else
        error "Please pull latest changes in ${1} repository manually"
    fi
}

function setup_symlinks() {
    APPLICATION_SUPPORT=~/Library/Application\ Support
    POWERLINE_ROOT_REPO=/usr/local/lib/python3.7/site-packages

    info "Setting up symlinks"
    symlink "git" ${REPO}/git/gitconfig ~/.gitconfig
#    symlink "hammerspoon" ${REPO}/hammerspoon ~/.hammerspoon

    # Disable shell login message
#    symlink "hushlogin" /dev/null ~/.hushlogin

    success "Symlinks successfully setup"
}

function symlink() {
    application=$1
    point_to=$2
    destination=$3
    destination_dir=$(dirname "$destination")

    if test ! -e "$destination_dir"; then
        substep "Creating ${destination_dir}"
        mkdir -p "$destination_dir"
    fi
    if rm -rf "$destination" && ln -s "$point_to" "$destination"; then
        substep "Symlinking for \"${application}\" done"
    else
        error "Symlinking for \"${application}\" failed"
        exit 1
    fi
}

function update_hosts_file() {
    info "Updating /etc/hosts"
    own_hosts_file_path=${REPO}/hosts/own_hosts_file
    ignored_keywords_path=${REPO}/hosts/ignored_keywords
    downloaded_hosts_file_path=/etc/downloaded_hosts_file
    downloaded_updated_hosts_file_path=/etc/downloaded_updated_hosts_file

    if sudo cp "${own_hosts_file_path}" /etc/hosts; then
        substep "Copying ${own_hosts_file_path} to /etc/hosts succeeded"
    else
        error "Copying ${own_hosts_file_path} to /etc/hosts failed"
        exit 1
    fi

    if sudo wget --quiet --output-document="${downloaded_hosts_file_path}" \
        https://someonewhocares.org/hosts/hosts; then
        substep "hosts file downloaded successfully"

        if ack --invert-match "$(cat ${ignored_keywords_path})" "${downloaded_hosts_file_path}" | \
            sudo tee "${downloaded_updated_hosts_file_path}" > /dev/null; then
            substep "Ignored patterns successfully removed from downloaded hosts file"
        else
            error "Failed to remove ignored patterns from downloaded hosts file"
            exit 1
        fi

        if cat "${downloaded_updated_hosts_file_path}" | \
            sudo tee -a /etc/hosts > /dev/null; then
            success "/etc/hosts updated"
        else
            error "Failed to update /etc/hosts"
            exit 1
        fi

    else
        error "Failed to download hosts file"
        exit 1
    fi
}

function setup_macOS_defaults() {
    info "Updating macOS preferences"

    current_dir=$(pwd)
    cd ${REPO}/macOS
    if bash macos.sh; then
        cd $current_dir
        success "macOS defaults updated successfully"
    else
        cd $current_dir
        error "macOS defaults update failed"
        exit 1
    fi
}

function update_login_items() {
    info "Updating login items"

    if osascript ${REPO}/macOS/login_items.applescript &> /dev/null; then
        success "Login items updated successfully "
    else
        error "Login items update failed"
        exit 1
    fi
}

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
