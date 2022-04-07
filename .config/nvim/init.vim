call plug#begin()
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-speeddating'
Plug 'easymotion/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-orgmode/orgmode'
Plug 'dhruvasagar/vim-table-mode'
Plug 'baskerville/vim-sxhkdrc'
call plug#end()

let mapleader = ","

set undofile
set undodir=$HOME/.viundo

set spelllang=en_au
set spellfile=$HOME/.local/share/nvim/spell/en.utf-8.add

augroup filetype_md
	autocmd FileType markdown setlocal textwidth=80
	" autocmd FileType markdown setlocal spell
augroup END

augroup filetype_txt
	autocmd FileType text setlocal textwidth=80
	" autocmd FileType text setlocal spell
augroup END

"fzf
imap <c-x><c-f> <plug>(fzf-complete-path)

"mundo
nnoremap <Leader>u :MundoToggle<CR>

"easymotion
let g:EasyMotion_keys = 'aoeuhtns'

"ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "mysnips"]

lua << EOF
require('orgmode').setup_ts_grammar()
require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
		disable = {'org'},
		additional_vim_regex_highlighting = {'org'},
		},
ensure_installed = {'org'},
}

require('orgmode').setup({
org_agenda_files = {'~/org/*'},
org_default_notes_file = '~/org/refile.org',
})
EOF
