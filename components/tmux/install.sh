#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$DIR/../common.sh"

TMUX_VERSION="3.1"

check-executable asdf

case "$OSTYPE" in
    darwin*)
        check-executable brew
        info "Ensuring pkg-config is present (required for tmux install)"
        brew install pkg-config
        ;;
esac

info "Installing tmux"
asdf plugin list | grep -Fxq 'tmux' || asdf install tmux "$TMUX_VERSION"
asdf global tmux "$TMUX_VERSION"
asdf install tmux "$TMUX_VERSION"

info "Installing tpm (tmux plugin manager)"
check-executable git
rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

info "Copying tmux configuration"
TMUX_SRC_NAME="tmux.conf"
TMUX_SRC_PATH="$DIR/$TMUX_SRC_NAME"
TMUX_TGT_NAME=".tmux.conf"
TMUX_TGT_PATH="$HOME/$TMUX_TGT_NAME"

cp_bak "$TMUX_SRC_PATH" "$TMUX_TGT_PATH"

info "Installing plugins"
"$HOME/.tmux/plugins/tpm/bindings/install_plugins"

info "Done installing and configuring tmux"

