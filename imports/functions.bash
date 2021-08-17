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

function do_you_want_execution_pause () {
    read -p ">>> do you want pause execution? [y(es) or n(o)]: " decision

    if [[ "$decision" = "y" ]]; then
        echo "true"
    else
        echo "false"
    fi
}

source /home/alexzander/Alexzander__/manjaro-auto-install/imports/colors.bash

function pause_execution () {
    read -p "$(echo -e "${bold}\n[press${endc} ${green}${bold}<enter>${endc} ${bold}to continue]:${endc} ")"
}

function print_colored_and_exec () {
    printf "\n\n${red}${bold}>>>${endc} ${yellow}${bold}$1${endc} [ ${green}${bold}running${endc} ]\n\n"
    eval $1
}

