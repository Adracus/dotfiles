#!/bin/bash

YES="y"
NO="n"

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
                ;;
        esac
    fi
    echo "Copying $src to $tgt"
    cp "$src" "$tgt"
}

