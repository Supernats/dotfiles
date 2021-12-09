#!/bin/sh -

which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    # Update Homebrew because it exists
    brew update
fi

# Install packages from the global Brewfile
brew bundle install --file=~/.config/brewfile/Brewfile
exit 0
