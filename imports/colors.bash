
BOLD=$(tput bold)

RED='\033[0;31m'
YELLOW="\033[1;33m"
GREEN="\033[0;32m"
CYAN="\033[0;36m"
WHITE="\033[1;37m"
BLUE="\033[0;34m"
PURPLE="\033[0;35m"

ENDC='\033[0m' # No Color

function red () {
    echo "${RED}${BOLD}$1${ENDC}"
}

function yellow () {
    echo "${YELLOW}${BOLD}$1${ENDC}"
}

function green () {
    echo "${GREEN}${BOLD}$1${ENDC}"
}

function cyan () {
    echo "${CYAN}${BOLD}$1${ENDC}"
}

function white () {
    echo "${WHITE}${BOLD}$1${ENDC}"
}

function blue () {
    echo "${BLUE}${BOLD}$1${ENDC}"
}

function purple () {
    echo "${PURPLE}${BOLD}$1${ENDC}"
}


function highlight() {
	declare -A fg_color_map
	fg_color_map[black]=30
	fg_color_map[red]=31
	fg_color_map[green]=32
	fg_color_map[yellow]=33
	fg_color_map[blue]=34
	fg_color_map[magenta]=35
	fg_color_map[cyan]=36
	 
	fg_c=$(echo -e "\e[1;${fg_color_map[$1]}m")
	c_rs=$'\e[0m'
	sed -u s"/$2/$fg_c\0$c_rs/g"
}

