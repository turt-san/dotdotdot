autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:*' enable git

zstyle ':vcs_info:*' check-for-changes
zstyle ':vcs_info:*' formats ' [%b]%m %c %u'
zstyle ':vcs_info:*' actionformats ' [%b|%a]%m'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+='T'
    fi
}

setopt PROMPT_SUBST

NEWLINE=$'\n'
PROMPT='%F{green}%*%f %F{blue}%~%f%F{red}${vcs_info_msg_0_}%f${NEWLINE}> '
