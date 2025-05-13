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

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# --- Editor
export VISUAL="/opt/nvim-linux-x86_64/bin/nvim"
export EDITOR="$VISUAL"
export SUDO_EDITOR="$VISUAL"

# --- Add programs to path
export PATH=~/.npm-global/bin:$PATH
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="$PATH:$HOME/go/bin/"

# --- Source program settings
# Rust
# . "$HOME/.cargo/env"
# Add settings to FZF to show .dotfiles but hide gitignored files
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
# LS
export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"

# --- Autocompletion sourcing
source <(helm completion bash)
source ~/.bash_completion/alacritty
source <(tailscale completion bash)
source <(cmctl completion bash)
# k3s config
source <(kubectl completion bash)
export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

# --- User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi

# Env variables
export YAMLLINT_CONFIG_FILE=$HOME/.config/nvim/.yamllint.yml

# Source complete-alias bashcompletion script
source ~/.bash_completion/complete_alias

# --- Fin

# Print TODO-list if not empty
grep -v '^#' ~/notes/TODO | cat

# Prompt
eval "$(starship init bash)"
