#!/bin/sh -

DIR=$(cd $(dirname $0) && pwd -P)
echo "\nCreating symlinks...\n"
$DIR/link.sh

echo "Installing Homebrew...\n"
$DIR/install_homebrew.sh

echo "Installing NeoVim Python dependencies...\n"
$DIR/pythonify_neovim.sh

echo "DONE!\n"
exit 0
