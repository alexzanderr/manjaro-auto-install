#!/usr/bin/bash

# at manjaro boot, choose proprietary drivers

manjaro_auto_install_dir=$(pwd)
manjaro_xfce_21_folder="/home/alexzander/Alexzander__/manjaro-21-xfce"

source $manjaro_auto_install_dir/imports/test.bash
source $manjaro_auto_install_dir/imports/colors.bash
source $manjaro_auto_install_dir/imports/functions.bash


# this is not good, this caused the pc not to boot 
# successfully from first time sometimes
# PRINT_COLORED_RED_AND_RUN "sudo pacman-mirrors -f5"


pause_value=$(do_you_want_execution_pause)
decision_prompting

pacman_update_force="sudo pacman -Syyu"

pacman_install_all="sudo pacman -S telegram-desktop \
fzy \
lolcat \
catimg \
obs-studio \
openssh \
atom \
psensor \
lm_sensors \
pa-applet \
hddtemp \
lua \
luajit \
xfce4-cpufreq-plugin \
xfce4-goodies \
xfce4-sensors-plugin \
xfce4-cpugraph-plugin \
xfce4-systemload-plugin \
xfce4-netload-plugin \
python-pip \
tk \
smartmontools \
qbittorrent \
pypy3 \
vlc \
putty \
nmap \
libreoffice-still \
make \
appimagelauncher \
arc-gtk-theme \
plank \
neofetch \
discord \
pydf \
tree \
yay \
jdk-openjdk \
dotnet-sdk \
tesseract \
ffmpeg \
xbindkeys \
sshpass \
xclip \
simple-scan \
wimlib \
neovim-qt \
alacritty \
xdotools \
ttf-dejavu \
noto-font-emoji \
keepassxc \
indicator-sensors \
make \
figlet \
speedtest-cli \
stow \
qt-creator \
blueman \
mercurial \
wireshark-qt \
wireshark-cli \
exa \
task \
timew \
taskwarrior-tui \
rust \
the_silver_searcher \
clamav \
gtop \
conky \
appmenu-gtk-module \
vala-panel-appmenu-common \
vala-panel-appmenu-registrar \
vala-panel-appmenu-xfce \
cheese \
cmake \
filezilla \
kdenlive \
bat \
pypy3 \
tmux \
zsh \
git \
docker \
yay \
--noconfirm"

pamac_install_from_aur="sudo pamac install bootiso \
git-ftp \
mdr \
glow \
neovim-nightly-bin \
lyrebird \
stacer \
teamviewer \
--no-confirm
"
# very important
# running sudo pip install will install packages into /usr/lib/python3.9/site-packages/
# that makes then globally accessible for home users and als root user
pip_install_packages="sudo pip install wpm \
ptpython \
Pigments \
pyinstaller \
playsound \
pyperclip \
opencv-python \
colored_traceback \
wave \
pydub \
python3-tk \
gtts \
pyttsx3 \
pytesseract \
numpy \
matplotlib \
bs4 \
numba \
pyzbar \
notify2 \
pytz \
SpeechRecognition \
requests_html \
datedelta \
tqdm \
selenium \
imageio \
pyautogui \
moviepy \
pyowm \
jedi \
buildozer \
Pillow pynput pyaudio youtube_dl"

declare -a commands_array
commands_array[0]=$pacman_update_force
commands_array[1]=$pacman_install_all
commands_array[2]=$pamac_install_from_aur
commands_array[3]=$pip_install_packages

for command in "${commands_array[@]}"; do
    # uncomment below to install everything
    # print_colored_and_exec "$command"
    echo "$command"
    [[ $pause_value = "true" ]] && pause_execution
done


# [[ -d "~/Alexzander__" ]] && rm -rf ~/Alexzander__
# mkdir -vp ~/Alexzander__

cd ~
hg clone /run/media/alexzander/SSD/mercurial_repos/Alexzander__

# after this we must run the script with stow

# git clone https://github.com/alexzanderr/manjaro-21-xfce-settings




# setup dmenu
cd $manjaro_xfce_21_folder/dotfiles/home/Applications__/dynamic_menu
sudo make clean install






# install zsh dependencies
$manjaro_auto_install_dir/installers/zsh_install.bash
sudo $manjaro_auto_install_dir/installers/zsh_install.bash

# install tmux dependencies
$manjaro_auto_install_dir/installers/tmux_install.bash
sudo $manjaro_auto_install_dir/installers/tmux_install.bash

# make symlink of default home folders that come with OS to my home folders
cd $manjaro_xfce_21_folder/home_folders
./generate_symlinks.sh


# dont forget to change default terminal to alacritty
# this is from my config files
# trebuie sa alegi alacritty -e "%s" cand iti da prompt dupa ce ai facut



# set default shell for all users
sudo usermod --shell /usr/bin/zsh root
sudo usermod --shell /usr/bin/zsh alexzander

# config docker
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo systemctl enable docker
# sudo systemctl start docker
newgrp docker

# enable teamviewer
sudo systemctl enable teamviewerd
# sudo systemctl start teamviewerd
# sudo teamviewer --daemon start

# bluetooth service
sudo systemctl enable bluetooth.service

# 
# sudo systemctl enable sshd.service
# sudo systemctl start sshd.service


# here you need to select from prompt
sudo pacman -S virtualbox


reboot_prompt
reboot
