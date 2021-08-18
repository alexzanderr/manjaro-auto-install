#!/usr/bin/bash

# at manjaro boot, choose proprietary drivers

manjaro_auto_install_dir=$(pwd)
export MANJARO_AUTO_INSTALL_DIR=$(pwd)

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
steam \
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
matploblib \
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
buildozer"

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


# copy binaries to /usr/bin
# img nu merge facut alias, aia e, il folosim ca binary
sudo cp -v $manjaro_auto_install_dir/binaries/img /usr/bin


mkdir -p ~/Alexzander__
git clone https://github.com/alexzanderr/manjaro-21-xfce-settings











# install lyra cursors (all of them)
for archive in "$(ls $manjaro_auto_install_dir/archives)"; do
    # decompress every tar gz and install cursors to
    # /usr/share/icons/...
    tar -xzvf ./archives/$archive --directory=cursors/
done

for cursor in "$(ls $manjaro_auto_install_dir/cursors)"; do
    # move every cursor folder to /usr/share/icons
    sudo mv -v $manjaro_auto_install_dir/$cursor /usr/share/icons
done



# clone and build lite editor
mkdir -p ~/Applications__
cd ~/Applications__
git clone https://github.com/rxi/lite
cd lite
./build.sh

# style -> matcha-dark-aliz
# icons -> papirus-dark
# system font -> roboto regular



# rog gaming center:
#     nu prea am vazut sa fie

#     dar putem sa instalam utility stuff in loc de gaming
#     ca pana la urma este o aplicatie care iti spune temp la CPU and GPU si
#         alte detalii tehnice; trebuie sa aiba:
#             - fan speed control
#             - CPU temp
#             - GPU temp
#             - Mhz speed
#             - free up memory button
#             - total amount of storage used
#             - total amount of ram used

# rog aura core (responsible for coloring the laptop keyboard):
#     https://github.com/wroberts/rogauracore

#     https://askubuntu.com/questions/1234312/how-to-control-rgb-lighting-for-asus-rog-laptops-built-in-keyboard

#     https://gitlab.com/CalcProgrammer1/OpenRGB

# adobe alternatives:
#     GIMP: Alternativee: Alternative to Adobe Illustrator. ...
#     Scribus: Alternative to Adobe Photoshop. ...
#     Inkscap to Adobe Indesign. ...
#     OpenShot: Alternative to Adobe Premiere. ...
#     Synfig: Alternative to Adobe Animate. ...
#     darktable: Alternative to Adobe Lightroom.

# install zsh dependencies
$manjaro_auto_install_dir/installers/zsh_install.bash

# install tmux dependencies
$manjaro_auto_install_dir/installers/tmux_install.bash

# make symlink of default home folders that come with OS
# home_folders="~/Alexzander__/manjaro-21-xfce/home_folders"
# # curr_dir=$(pwd)

# for item in $(ls $home_folders)
# do
#     if [[ -d $home_folders/$item ]]; then
#         ln -vs $home_folders/$item ~/$item
#     fi
# done


# dont foget to change default terminal to alacritty

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

# here you need to select from prompt
sudo pacman -S virtualbox
