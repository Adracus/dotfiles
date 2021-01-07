#!/usr/bin/env bash

# Choice values
YES="y"
NO="n"

# Color values
RED='\033[0;31m'
CYAN='\033[0;36m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color
IC='\033[41m' # Invalid Color

function upcase {
    printf "%s" "$1" | awk '{ print toupper($0) }'
}

function downcase {
    printf "%s" "$1" | awk '{ print tolower($0) }'
}

function header {
    echo "========================================="
    echo "$1"
    echo "========================================="
}

function newline {
    echo ""
}

function __log-color {
    level="$(upcase "$1")"
    case "$level" in
        INFO)
            echo "$CYAN"
            ;;
        WARN)
            echo "$ORANGE"
            ;;
        ERROR|FATAL)
            echo "$RED"
            ;;
        *)
            echo "$IC"
            ;;
    esac
}

function log {
    level="$(upcase "$1")"
    printf "$(__log-color "$level")$level [$(date +'%T')]: "
    shift
    echo $@
    printf "$NC"
}

function info {
    log info $@
}

function warn {
    log warn $@
}

function error {
    log error $@
}

function fatal {
    log fatal $@
    exit 1
}

function check-executable {
    if ! command -v "$1" &> /dev/null; then
        fatal "executable '$1' needs to be present on PATH"
    fi
}

function check-is-root {
    if [ "$EUID" -ne 0 ]; then
        fatal "Please run this as root"
    fi
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

function ensure-line {
    line="$1"
    file="$2"
    if [[ -z $line || -z $file ]]; then
        fatal "ensure-line <line> <file>"
    fi
    if ! grep -Fxq "$line" "$file"; then
        echo "$line" >> "$file"
    fi
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

