# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi

# Editor
export VISUAL="/opt/nvim-linux-x86_64/bin/nvim"
export EDITOR="$VISUAL"
export SUDO_EDITOR="$VISUAL"

# Add nvim to path
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# Add settings to FZF to show .dotfiles but hide gitignored files
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# Alacritty autocompletion
source ~/.bash_completion/alacritty

# Print TODO-list if not empty
echo "$(grep -v '^#' ~/notes/TODO)" | cat

# Prompt
eval "$(starship init bash)"
