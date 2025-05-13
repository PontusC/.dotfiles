#!/bin/bash
# Copies all config-files to this folder

# Backup bashrc and aliases
cp ~/.bashrc ./bashrc
cp -r ~/.bashrc.d/* ./bashrc.d/

# Backup i3 conf
cp ~/.config/i3/config ./config/i3/config

# Backup starship
cp ~/.config/starship.toml ./config/starship.toml

# Backup autocompletions
cp ~/.bash_completion/* ./bash_completion/

# Backup Alacritty
cp ~/.config/alacritty/alacritty.toml ./config/alacritty/alacritty.toml
