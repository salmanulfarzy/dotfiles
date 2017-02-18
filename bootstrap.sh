#!/usr/bin/env bash

###############################
## This script installs the dotfiles
###############################

source ./lib/echos.sh
source ./lib/requirers.sh


bot "hi! I'm going to install tooling. Here I go..."

#################################
## install homebrew
#################################

running "checking homebrew install"
brew_bin=$(which brew) 2>&1 > /dev/null
if [[ $? != 0 ]]; then
    action "installing hoembrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    if [[ $? != 0 ]]; then
        error "unable to install homebew, script $0 abort!"
        exit 2
    fi
else
    ok
    ## make sure we're on latest homebrew
    running "updating homebrew"
    brew update
    ok
    bot "before installing brwe paclages, we can upgrade any outdated packages"
    read -r -t "run brwe upgrade ? [y|N] " response
    if [[ $response =~ ^(y|yes|Y) ]]; then
        action "upgrade brew packages..."
        brew upgrade
        ok "brwe updated..."
    else
        ok "skipped brew package upgrade.";
    fi
fi


####################################
## install brew cask 
####################################

running "checking brew cask install"
output=$(brew tap | grep cask)
if [[ $? != 0 ]]; then
    action "installing brew cask"
    require_brew caskroom/cask/brew-cask
fi
brew tap caskroom/versions > /dev/null 2>&1
ok

require_brew git
require_brew zsh
require_brew ruby

CURRENTSHELL=$(dscl . -read /Users/$USER UserShell | awk '{print $2}')
if [[ "$CURRENTSHELL" != "/usr/local/bin/zsh" ]]; then
    bot "setting newer homebrew zsh as defauls (password required)"
    sudo dscl . -change /Users/$USER UserShell $SHELL /usr/local/bin/zsh > /dev/null 2>&1
    ok
fi

## Add zsh theme here
#if [[ ! -d "./oh-my-zsh/custom/themes/powerlevel9k" ]]; then
#  git clone https://github.com/bhilburn/powerlevel9k.git oh-my-zsh/custom/themes/powerlevel9k
#fi

bot "creating symlinks for dotfiles..."
now=$(date +"%Y.%m.%d.%H.%M.%S")

for file in .*; do
    if [[ $file == "." || $file  == ".." ]]; then
        continue
    fi
    running "~/$file"
    # if the file exists:
    if [[ -e ~/$file ]]; then
        mkdir -p ~/.dotfiles_backup/$now
        mv ~/$file ~/.dotfiles_backup/$now/$file
        echo "backup saved as ~/.dotfiles_backup/$now/$file"
    fi
    # remove existing symlinks
    unlink ~/$file > /dev/null 2>&1
    # create the symlink
    ln -s ~/.dotfiles/$file ~/$file
    echo -en '\tlinked';ok
done

popd > /dev/null 2>&1

bot "installing vim plugins"

# cmake is required to compile vim bundle YouCompleteMe
# require cmake
vim +PluginInstall +qll > /dev/null 2>&1

bot "Installation complete ~"
