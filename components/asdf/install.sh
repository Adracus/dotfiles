#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$DIR/../common.sh"

ASDF_VERSION="v0.8.0"

case "$OSTYPE" in
    linux*)
        check-executable apt

        info "Ensuring asdf's immediate dependencies (curl, git)"
        sudo apt install curl git

        info "Cloning asdf's repository ($ASDF_VERSION)"
        git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch "$ASDF_VERSION"

        info "Updating .zshrc"
        ensure-line '. $HOME/.asdf/asdf.sh' ~/.zshrc
        ;;
    darwin*)
        check-executable brew
        info "Ensuring asdfs immediate dependencies (coreutils, curl, git)"
        brew install coreutils curl git

        info "Installing asdf"
        brew install asdf

        info "Updating .zshrc"
        ensure-line '. $(brew --prefix asdf)/asdf.sh' ~/.zshrc
        ;;
    *)
        fatal "Unknown operating system type $OSTYPE"
esac

