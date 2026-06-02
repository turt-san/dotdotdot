bindkey -r "^["

bindkey "^[[1;5c" forward-word
bindkey "^[[1;5d" backward-word
bindkey "^[[h" beginning-of-line
bindkey "^[[f" end-of-line

function run-editzshrc { nvim ~/.config/zsh }
zle -N run-editzshrc

function run-editmpv { nvim ~/.config/mpv }
zle -N run-editmpv

function run-editnvim { nvim ~/.config/nvim/init.lua }
zle -N run-editnvim

bindkey "^f"  run-editzshrc
bindkey "^xm" run-editmpv
bindkey "^xn" run-editnvim
