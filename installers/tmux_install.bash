#!/usr/bin/bash


echo -e "current user: $USER"
echo -e "pwd: $(pwd)"
echo -e "home folder: $HOME"

tmux_config_dir="$HOME/.config/tmux"
echo $tmux_config_dir

if [ -d $tmux_config_dir ]; then
    echo $tmux_config_dir exists
    # if exists make sure to clean it
    # rm -rf $tmux_config_dir
    # and create again
    # mkdir -p $tmux_config_dir
fi

# install the tmux plugin manager
git clone https://github.com/tmux-plugins/tpm $tmux_config_dir/plugin/tpm
