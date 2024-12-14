syntax on
filetype plugin indent on

set number
set tabstop=2     " show existing tab with 2 spaces width
set shiftwidth=2  " when indenting with '>', use 2 spaces width
set expandtab     " on pressing tab, insert 2 spaces
inoremap <S-Tab> <C-V><Tab>

set backspace=indent,eol,start

set foldmethod=marker
set mouse-=a

colorscheme default

" See also:
" - https://github.com/amix/vimrc.git
""
