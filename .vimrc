filetype plugin indent on
syntax enable

set termguicolors

packadd ayu-vim
packadd vim-lumen
colorscheme ayu

let g:is_posix = 1

set expandtab
set hlsearch
"set mouse=a
set number
set numberwidth=4
set shiftwidth=4
set signcolumn=yes
set tabstop=4
set updatetime=100

packadd sleuth

highlight ExtraWhitespace ctermbg=darkred guibg=darkred
match ExtraWhitespace /\s\+$/

function! CleverTab()
    if pumvisible()
        return "\<C-N>"
    endif
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    elseif exists('&omnifunc') && &omnifunc != ''
        return "\<C-X>\<C-O>"
    else
        return "\<C-N>"
    endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

