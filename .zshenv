#
# Defines environment variables.
#
# Based on https://github.com/sorin-ionescu/prezto/blob/master/runcoms/zshenv
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Disable system-level git config, because it loads the osxkeychain credential helper
#export GIT_CONFIG_NOSYSTEM=1

# Go
export GOPRIVATE="github.com/gbernady"

# KeePassXC
export KPXC_CONFIG="${HOME}/.config/keepassxc/keepassxc.ini"

# Rust
if [[ -s "${HOME}/.cargo/env" ]]; then
  source "${HOME}/.cargo/env"
fi
