#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$DIR/../common.sh"

TMUX_SRC_NAME="tmux.conf"
TMUX_SRC_PATH="$DIR/$TMUX_SRC_NAME"
TMUX_TGT_NAME=".tmux.conf"
TMUX_TGT_PATH="$HOME/$TMUX_TGT_NAME"

cp_bak "$TMUX_SRC_PATH" "$TMUX_TGT_PATH"

