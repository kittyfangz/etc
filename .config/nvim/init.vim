call plug#begin()
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

imap <c-x><c-f> <plug>(fzf-complete-path)
