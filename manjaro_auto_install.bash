#!/usr/bin/bash

function decision_prompting () {
    read -p ">>> are sure you want to proceed? [y(es) or <enter> | n(o)]: " decision

    if [[ "$decision" = "y" ]]; then
        echo "proceeding..."

    elif [[ "$decision" = "" ]]; then
        read -p ">>> press again <enter> to proceed: " decision

        if [[ "$decision" = "" ]]; then
            echo "proceeding..."
        else
            echo "aborted."
            exit
        fi
    else
        echo "aborted."
        exit
    fi
}

current_working_dir=$(pwd)

source $current_working_dir/imports/test.bash
source $current_working_dir/imports/colors.bash

echo -e "$red test"
