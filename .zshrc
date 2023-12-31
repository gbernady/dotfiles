#
# Executes commands at the start of an interactive session.
#
# Based on https://github.com/sorin-ionescu/prezto/blob/master/runcoms/zshrc
#

# Cache custom completions if needed to allow them being picked up by zcompile
sitefuncs="${XDG_CACHE_HOME:-$HOME/.cache}/site-functions"
if [[ ! -d "$sitefuncs" ]]; then
  mkdir -p "$sitefuncs"

  if (( $+commands[op] )); then
    op completion zsh >! "${sitefuncs}/_op"
  fi

  if (( $+commands[rustup] )); then
    rustup completions zsh rustup >! "${sitefuncs}/_rustup"
    rustup completions zsh cargo >! "${sitefuncs}/_cargo"
  fi

fi

# Source Prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Zsh history deduplication
setopt hist_ignore_all_dups

# iTerm2 shell integration
if [[ -s "${HOME}/.iterm2_shell_integration.zsh" ]]; then
  source "${HOME}/.iterm2_shell_integration.zsh"
fi

# Secretive ssh agent
export SSH_AUTH_SOCK="${HOME}/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh"

#
# Aliases
#

# Dotfiles
alias dtf='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'

# Git
alias gcaa="gca --amend"
alias gWa='git worktree add'
alias gWl='git worktree list'
alias gWr='git worktree remove'
alias gWR='git worktree remove -f'
alias gWp='git worktree prune'

# GPG
alias gpg-relearn='gpg-connect-agent "scd serialno" "learn --force" /bye'

# Kubernetes
alias k=kubectl

# Ruby fixup for Zsh
alias bundle='noglob bundle'
alias rake='noglob rake'

# Tools
alias rot13='(){ echo $1 | tr "A-Za-z" "N-ZA-Mn-za-m" ;}'
alias uuid="uuidgen | tr 'A-Z' 'a-z'"
