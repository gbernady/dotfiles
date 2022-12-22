filetype plugin indent on
syntax enable

set termguicolors

packadd ayu-vim
set background=dark
let g:ayucolor="dark"
colorscheme ayu

set expandtab
set hlsearch
set number
set numberwidth=4
set shiftwidth=4
set signcolumn=yes
set updatetime=100
set mouse=a

packadd sleuth

:highlight ExtraWhitespace ctermbg=darkred guibg=darkred
:match ExtraWhitespace /\s\+$/

