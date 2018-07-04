#!/bin/bash

YES="y"
NO="n"

# Directory where this script is located at
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

VIMRC_NAME=".vimrc"
VIMRC_PATH="$DIR/$VIMRC_NAME"
TARGET_VIMRC_PATH="$HOME/$VIMRC_NAME"

TMUX_CONF_NAME=".tmux.conf"
TMUX_CONF_PATH="$DIR/$TMUX_CONF_NAME"
TARGET_TMUX_CONF_PATH="$HOME/$TMUX_CONF_NAME"

function header {
    echo "========================================="
    echo "$1"
    echo "========================================="
}

function newline {
    echo ""
}

function ask_yes_no {
    local prompt="${1:-"Continue"}"
    local default="${2:-"$YES"}"
    local message="$prompt ($YES/$NO) [$default]: "
    read -p "$message" choice
    case "$choice" in
        y|Y ) echo "$YES";;
        n|N ) echo "$NO";;
        '') echo "$default";;
        * )
            >&2 echo "Invalid input: '$choice'"
            ask_yes_no "$1";;
    esac
}

function cp_bak {
    local src="$1"
    local tgt="$2"
    if [ -f "$tgt" ]; then
        echo "$tgt already exists"
        local backup_path="$tgt.bak"
        case "$(ask_yes_no "Create backup file at $backup_path?")" in
            "$YES")
                echo "Creating backup at $backup_path"
                cp "$tgt" "$backup_path"
                ;;
            "$NO")
                echo "Won't create a backup of $tgt"
                return
                ;;
        esac
        echo "Copying $src to $tgt"
        cp "$src" "$tgt"
    fi
}

function install_vimrc {
    header "$VIMRC_NAME Installation"
    case "$(ask_yes_no "Skip $VIMRC_NAME installation?" "$NO")" in
        "$YES")
            echo "Skipping $VIMRC_NAME installation"
            ;;
        "$NO")
            cp_bak "$VIMRC_PATH" "$TARGET_VIMRC_PATH"
            ;;
    esac
}

function install_tmux_conf {
    header ".tmux.conf installation"
    case "$(ask_yes_no "Skip $TMUX_CONF_NAME installation?" "$NO")" in
        "$YES")
            echo "Skipping $TMUX_CONF_NAME installation"
            ;;
        "$NO")
            cp_bak "$TMUX_CONF_PATH" "$TARGET_TMUX_CONF_PATH"
            ;;
    esac
}


header "Dotfile Installation"
newline

install_vimrc
newline

install_tmux_conf
newline

echo "Done"

