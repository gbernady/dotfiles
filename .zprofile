#
# Executes commands at login pre-zshrc.
#
# Based on https://github.com/sorin-ionescu/prezto/blob/master/runcoms/zprofile
#

#
# Browser
#

if [[ -z "$BROWSER" && "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

if [[ -z "$EDITOR" ]]; then
  export EDITOR='vim'
fi
if [[ -z "$VISUAL" ]]; then
  export VISUAL='vim'
fi
if [[ -z "$PAGER" ]]; then
  export PAGER='less'
fi

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
cdpath=(
  $cdpath
)

# Set the list of directories that Zsh searches for function definitions.
fpath=(
  $HOME/.cache/site-functions
  /opt/{homebrew,local}/share/zsh/site-functions(N)
  $fpath
)

# Set the list of directories that Zsh searches for programs.
path=(
  $HOME/{,s}bin(N)
  $HOME/.cargo/bin(N)
  $HOME/.local/bin(N)
  $HOME/go/bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X to enable it.
if [[ -z "$LESS" ]]; then
  export LESS='-g -i -M -R -S -w -X -z-4'
fi

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if [[ -z "$LESSOPEN" ]] && (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi
