#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "$DIR/components/common.sh"

for component_dir in "$DIR/components/"*/; do
    component_name="$(basename "$component_dir")"
    header "$component_name"

    case "$(ask_yes_no "Install $component_name?")" in
        "$YES")
            "$component_dir"/install.sh
            ;;
        "$NO")
            echo "Skipping $component_name installation"
            ;;
    esac
done

