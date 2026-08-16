CFG_DIR="$HOME/.config/zsh"

if [[ -z $TMUX ]]; then source "$CFG_DIR/motd.zsh"; fi
# source "$CFG_DIR/rest.zsh"
# source "$CFG_DIR/cachyos-config.zsh"

export EDITOR="nvim"
export SUDOEDITOR="nvim"
export MANPAGER="nvim +Man!"

# disables Ctrl-S and Ctrl-Q to freeze and unfreeze the screen
stty -ixon

source "$CFG_DIR/alias.zsh"
source "$CFG_DIR/functions.zsh"
source "$CFG_DIR/tmux.zsh"
source "$CFG_DIR/keybinds.zsh"
source "$CFG_DIR/completions.zsh"
source "$CFG_DIR/ps1.zsh"
source "$CFG_DIR/paths.zsh"
