#
# Defines environment variables.
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

#
# Golang
#
export GOPRIVATE="github.com/gbernady"

#
# KeePassXC
#
export KPXC_CONFIG="${HOME}/.config/keepassxc/keepassxc.ini"

#
# Rust
#
if [[ -s "${HOME}/.cargo/env" ]]; then
  source "${HOME}/.cargo/env"
fi
