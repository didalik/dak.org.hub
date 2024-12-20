syntax on
filetype plugin indent on

set number
set tabstop=2     " show existing tab with 2 spaces width
set shiftwidth=2  " when indenting with '>', use 2 spaces width
set expandtab     " on pressing tab, insert 2 spaces
set updatecount=0 " the writing to the swap file is not wanted
set backspace=indent,eol,start
set foldmethod=marker
set mouse-=a

" To make Vim insert a literal tab character when you press <S-Tab>:
inoremap <S-Tab> <C-V><Tab>
"	Like this	t2	t3 - this line holds 3 tabs

colorscheme default

" See also:
" - https://superuser.com/questions/768894/mapping-s-tab-in-vim
" - https://github.com/amix/vimrc.git
""
