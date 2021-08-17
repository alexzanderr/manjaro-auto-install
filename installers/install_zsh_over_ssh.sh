#
#
# this script must be run with SUDO
#
#

# if you run this script with root, ofc the user is root
home=/home/alexzander
echo -e "home is: $home"


pwd

# removing everything to make clean
rm -rf $home/.config/zsh
rm -rf /root/.config/zsh

# creating empty dirs
mkdir -p $home/.config/zsh
mkdir -p /root/.config/zsh

# removing the git cloned repo if already existent
rm -rf $home/zsh
rm -rf /root/zsh

# adding the repo
cd $home
git clone https://github.com/alexzanderr/zsh.git
cd zsh

# in case it doesnt exist

# copy only what we need

# the prompt
cp alexzander-custom.zsh-theme $home/.config/zsh
cp alexzander-custom.zsh-theme /root/.config/zsh

# the rc
cp .zshrc $home/.config/zsh
cp .zshrc /root/.config/zsh

# my customasd scripts
cp -r zsh_python_scripts $home/.config/zsh
cp -r zsh_python_scripts /root/.config/zsh


# without this you are mucles
# in case it doesnt exist
rm -rf /etc/zsh
mkdir -p /etc/zsh

cp zshenv /etc/zsh
cp zprofile /etc/zsh
# installing everything in home config


cd $home/.config/zsh
git clone https://github.com/zplug/zplug ./.zplug
git clone https://github.com/ohmyzsh/ohmyzsh.git ./.oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ./zsh-autosuggestions

# and change permissions in home only
# because when you run zsh as normal user you cant do some things, because ownership was set to root due to sudo installation
chown -R alexzander.alexzander $home/.config/zsh


# installing everything in root config
cd /root/.config/zsh
git clone https://github.com/zplug/zplug ./.zplug
git clone https://github.com/ohmyzsh/ohmyzsh.git ./.oh-my-zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ./zsh-autosuggestions




# at the end
# remove the zsh from git clone
rm -rf $home/zsh

# dependencies
if ! command -v lolcat &> /dev/null
then
    echo -e "lolcat could not be found\ninstalling...\n"
    apt install lolcat
fi

if ! command -v fzf &> /dev/null
then
    echo -e "lolcat could not be found\ninstalling...\n"
    apt install fzf
fi

if ! command -v pip &> /dev/null
then
    echo -e "pip could not be found\ninstalling...\n"
    apt install python3-pip
fi

pip install colored_traceback


# python part
rm -rf $home/Alexzander__/programming/python3

mkdir -p $home/Alexzander__/programming
cd $home/Alexzander__/programming
git clone https://github.com/alexzanderr/python3.git


echo "export PYTHONPATH=$PYTHONPATH:/home/alexzander/Alexzander__/programming/python3" >> $home/.profile
echo "export PYTHONPATH=$PYTHONPATH:/home/alexzander/Alexzander__/programming/python3" >> /root/.profile


chown -R alexzander.alexzander /etc/zsh

echo -e "\ndone.\n"


# in case zplug cant load fzy, its because you must install fzy

# fzy is a fast, simple fuzzy text selector for the terminal with an advanced scoring algorithm
# fix with sudo apt install fzy



