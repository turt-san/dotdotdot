autoload -Uz vcs_info
zmodload zsh/datetime   # provides $EPOCHSECONDS

FETCH_INTERVAL=300      # seconds between background fetches per repo

background_fetch() {
  local gitdir stamp last=0
  gitdir=$(git rev-parse --absolute-git-dir 2>/dev/null) || return
  git rev-parse --abbrev-ref '@{u}' &>/dev/null || return   # no upstream, nothing to compare

  stamp=$gitdir/prompt-last-fetch
  [[ -e $stamp ]] && last=$(<$stamp)
  (( EPOCHSECONDS - last < FETCH_INTERVAL )) && return

  print -r -- $EPOCHSECONDS > $stamp   # stamp first, so failures (offline) don't retry every prompt

  GIT_TERMINAL_PROMPT=0 \
  GIT_SSH_COMMAND="ssh -o BatchMode=yes -o ConnectTimeout=5" \
    git fetch --quiet --no-tags &>/dev/null &!
}

precmd() {
  vcs_info
  background_fetch
}

zstyle ':vcs_info:*' enable git

zstyle ':vcs_info:*' check-for-changes
zstyle ':vcs_info:*' formats ' [%b]%m %c %u'
zstyle ':vcs_info:*' actionformats ' [%b|%a]%m'

zstyle ':vcs_info:git*+set-message:*' hooks git-check

# Alternative glyphs
# ✱⇡

+vi-git-check() {
 if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]]; then
  UNPUSHED=$(git log --oneline @{u}.. 2> /dev/null | wc -l)
  if [[ -n $UNPUSHED ]] && [[ $UNPUSHED != '0' ]]; then
   hook_com[misc]+=$(echo " U$UNPUSHED")
  fi
  UNPULLED=$(git log --oneline ..@{u} 2> /dev/null | wc -l)
  if [[ -n $UNPULLED ]] && [[ $UNPULLED != '0' ]]; then
   hook_com[misc]+=$(echo " D$UNPULLED")
  fi

  GIT_STATUS=$(git status --porcelain)
  # Staged files
  STAGED=$(echo $GIT_STATUS | grep -v '??' | grep -v "^ " | grep -v "^$" | wc -l) 
  if [[ -n $STAGED ]] && [[ $STAGED != '0' ]]; then
   hook_com[misc]+=" +$STAGED"
  fi
  # Unstaged files
  UNSTAGED=$(echo $GIT_STATUS | grep -v '??' | grep "^ " | wc -l) 
  if [[ -n $UNSTAGED ]] && [[ $UNSTAGED != '0' ]]; then
   hook_com[misc]+=" !$UNSTAGED"
  fi
  # Untracked files
  UNTRACKED=$(echo $GIT_STATUS | grep '??' | wc -l) 
  if [[ -n $UNTRACKED ]] && [[ $UNTRACKED != '0' ]]; then
   hook_com[misc]+=" ?$UNTRACKED"
  fi
 fi
}

setopt PROMPT_SUBST

NEWLINE=$'\n'
PROMPT='%F{green}%*%f %F{blue}%~%f%F{red}${vcs_info_msg_0_}%f${NEWLINE}> '
