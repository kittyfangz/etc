let mapleader = ","

call plug#begin()
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-speeddating'
Plug 'easymotion/vim-easymotion'
call plug#end()

let g:EasyMotion_keys = 'aoeuidtns-'

imap <c-x><c-f> <plug>(fzf-complete-path)
