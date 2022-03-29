call plug#begin()
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
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

"fzf
imap <c-x><c-f> <plug>(fzf-complete-path)

"easymotion
let g:EasyMotion_keys = 'aoeuidtns-'

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
