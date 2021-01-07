#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$DIR/../common.sh"

MACOS_RUBY_VERSION="2.6.3"

VIM_VERSION="8.2.2307"

VIMRC_SRC_NAME="vimrc"
VIMRC_SRC_PATH="$DIR/$VIMRC_SRC_NAME"
VIMRC_TGT_NAME=".vimrc"
VIMRC_TGT_PATH="$HOME/$VIMRC_TGT_NAME"

check-executable asdf

case "$OSTYPE" in
    darwin*)
        info "On Catalina, there's an issue with the ruby installation."
        info "Fixing the location of some header files to address that issue."
        sudo cp /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/Ruby.framework/Headers/ruby/config.h /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/Ruby.framework/Versions/Current/usr/include/ruby-2.6.0/ruby/
        ;;
esac

info "Installing asdf vim plugin (if not installed yet)"
asdf plugin list | grep -Fxq 'vim' || asdf install tmux "$VIM_VERSION"

info "Installing vim version $VIM_VERSION"
asdf global vim "$VIM_VERSION"
asdf install vim "$VIM_VERSION"

info "Copying over vimrc"
cp_bak "$VIMRC_SRC_PATH" "$VIMRC_TGT_PATH"

info "Running plugin installation"
vim +PlugInstall +qall

info "Successfully installed and configured vim"

