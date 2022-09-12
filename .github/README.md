# dotfiles

I track my dotfiles in a bare git repository ([ref](https://www.google.com/search?q=dotfiles+bare+git+repo)).

## Usage

```zsh
git clone --bare git@github.com:gbernady/dotfiles.git ~/.dotfiles.git
alias dtf='git --git-dir=$HOME/.dotfiles.git --work-tree=$HOME'
dtf config --local status.showUntrackedFiles no
dtf checkout
dtf submodule update --init --recursive
```

## License

MIT License

Copyright (c) 2022 Grzegorz Bernady

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
