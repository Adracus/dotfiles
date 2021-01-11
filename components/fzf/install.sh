#!/bin/bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$DIR/../common.sh"

FZF_VERSION="0.25.0"

check-executable asdf

info "Installing fzf"
asdf plugin list | grep -Fxq 'fzf' || asdf install fzf "$FZF_VERSION"
asdf global fzf "$FZF_VERSION"
asdf install fzf "$FZF_VERSION"

info "Adding shell completion and keybindings"
ensure-line '. $(asdf where fzf)/shell/completion.zsh' ~/.zshrc
ensure-line '. $(asdf where fzf)/shell/key-bindings.zsh' ~/.zshrc

info "Done installing and configuring fzf"

