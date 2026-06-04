bindkey -r "^["

bindkey "^[[1;5c" forward-word
bindkey "^[[1;5d" backward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

function run-editzshrc { nvim ~/.config/zsh }
zle -N run-editzshrc

function run-editmpv { nvim ~/.config/mpv }
zle -N run-editmpv

function run-editnvim { nvim ~/.config/nvim/init.lua }
zle -N run-editnvim

bindkey "^fz"  run-editzshrc
bindkey "^fm" run-editmpv
bindkey "^fn" run-editnvim
