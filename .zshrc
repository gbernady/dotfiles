#
# Executes commands at the start of an interactive session.
#
# Based on https://github.com/sorin-ionescu/prezto/blob/master/runcoms/zshrc
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Enable 1Password CLI Zsh completions
eval "$(op completion zsh)"; compdef _op op

# Zsh history deduplication
setopt hist_ignore_all_dups

# iTerm2 shell integration
if [[ -s "${HOME}/.iterm2_shell_integration.zsh" ]]; then
  source "${HOME}/.iterm2_shell_integration.zsh"
fi

#
# Aliases
#

# Dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'

# Git
alias gcaa="gca --amend"
alias gWa='git worktree add'
alias gWl='git worktree list'
alias gWr='git worktree remove'
alias gWR='git worktree remove -f'
alias gWp='git worktree prune'

# Kubernetes
alias k=kubectl

# Ruby fixup for Zsh
alias bundle='noglob bundle'
alias rake='noglob rake'

# Tools
alias rot13='(){ echo $1 | tr "A-Za-z" "N-ZA-Mn-za-m" ;}'
alias uuid="uuidgen | tr 'A-Z' 'a-z'"
