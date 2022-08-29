# dotfiles

I track my dotfiles in a bare git repository ([ref](https://www.google.com/search?q=dotfiles+bare+git+repo)).

## Usage

```zsh
git clone --bare git@github.com:gbernady/dotfiles.git ~/.dotfiles.git
alias dotfiles='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
dotfiles submodule update --init --recursive
```
