#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$DIR/../common.sh"

VIMRC_SRC_NAME="vimrc"
VIMRC_SRC_PATH="$DIR/$VIMRC_SRC_NAME"
VIMRC_TGT_NAME=".vimrc"
VIMRC_TGT_PATH="$HOME/$VIMRC_TGT_NAME"

cp_bak "$VIMRC_SRC_PATH" "$VIMRC_TGT_PATH"

