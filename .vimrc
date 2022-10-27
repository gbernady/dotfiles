filetype plugin indent on
syntax enable

set termguicolors

packadd ayu-vim
set background=dark
let g:ayucolor="mirage"
colorscheme ayu
highlight SignColumn guibg=#242936

set expandtab
set hlsearch
set number
set numberwidth=4
set shiftwidth=4
set signcolumn=yes
set updatetime=100

packadd sleuth

:highlight ExtraWhitespace ctermbg=darkred guibg=darkred
:match ExtraWhitespace /\s\+$/

