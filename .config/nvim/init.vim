" vim: fdm=marker
" keybindings {{{
let mapleader = ","
let maplocalleader = "\<space>"

nnoremap <Leader>g gqip
" }}}

" statusline {{{
function! Stl_Current_Wordcount()
	if wordcount()->has_key('cursor_words')
		return wordcount().cursor_words
	else " probably in visual mode
		return wordcount().visual_words
	endif
endfunction

set statusline=[%n]
set statusline+=%.20f\  "file path
set statusline+=%m "modified flag
set statusline+=%r "readonly flag
set statusline+=%y "filetype

set statusline+=%= "right side
set statusline+=%{Stl_Current_Wordcount()}/ "cursor wordcount
set statusline+=%{wordcount().words}w\ "wordcount
set statusline+=%v\  "visual column number
set statusline+=%l "current line
set statusline+=/
set statusline+=%L "total lines
" }}}

" undo {{{
set undofile
set undodir=$HOME/.viundo
"}}}

" file types {{{
" txt {{{
" center first 2 lines, then left
augroup filetype_txt
	autocmd!
	autocmd FileType text setlocal textwidth=80
	autocmd FileType text setlocal formatoptions+=a
augroup END
" }}}
" }}}

" plugins {{{
" plugin installation {{{
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
Plug 'karolbelina/uxntal.vim'
call plug#end()
" }}}

" fzf {{{
imap <c-x><c-f> <plug>(fzf-complete-path)
" }}}

" mundo {{{
nnoremap <Leader>u :MundoToggle<CR>
" }}}

" easymotion {{{
let g:EasyMotion_keys = 'aoeuhtns'
" }}}

" ultisnips {{{
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "mysnips"]
" }}}

" org {{{
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
" }}}
" }}}
