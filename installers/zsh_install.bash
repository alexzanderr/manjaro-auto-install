#!/usr/bin/bash


echo -e "current user: $USER"
echo -e "pwd: $(pwd)"
echo -e "home folder: $HOME"

zsh_config_dir="$HOME/.config/zsh"
echo $zsh_config_dir

if [ -d $zsh_config_dir ]; then
    echo $zsh_config_dir exists
    # if exists make sure to clean it
    # rm -rf $zsh_config_dir
    # and create again
    # mkdir -p $zsh_config_dir
fi

# installing zplug plugin manager
git clone https://github.com/zplug/zplug.git $zsh_config_dir/.zplug

# installing oh-my-zsh framework
git clone https://github.com/ohmyzsh/ohmyzsh.git $zsh_config_dir/.oh-my-zsh
