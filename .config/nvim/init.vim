" vim: fdm=marker
" keybindings {{{
let mapleader = ","
let maplocalleader = "\<space>"

nnoremap <Leader>g gqip
nnoremap <Leader>b :ls<CR>:b
nnoremap gb :b#<CR>
" i don't know how to do this better
vnoremap zf <Esc>'>mm'<O<Esc>m<'mo<Esc>m>gvzf
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

set textwidth=80 exrc secure

" plugins {{{
" plugin installation {{{
call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'baskerville/vim-sxhkdrc'
Plug 'dhruvasagar/vim-table-mode'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'karolbelina/uxntal.vim'
Plug 'lervag/vimtex'
Plug 'nvim-orgmode/orgmode'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vimwiki/vimwiki'
call plug#end()
" }}}

" fzf {{{
imap <c-x><c-f> <plug>(fzf-complete-path)
" }}}

" mundo {{{
nnoremap U :MundoToggle<CR>
" }}}

" easymotion {{{
let g:EasyMotion_keys = 'aoeuhtns'
" }}}

" ultisnips {{{
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories = [$HOME . '/.config/nvim/snip']
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

" tex {{{
let g:vimtex_view_method = 'zathura'
" }}}

" vimwiki {{{
let g:vimwiki_global_ext=0
" }}}

" pandoc {{{
let g:pandoc#syntax#conceal#use = 0
" }}}

" goyo/limelight {{{
let g:limelight_conceal_ctermfg = 'Gray'

augroup goyoc
	autocmd!
	autocmd User GoyoEnter Limelight
	autocmd User GoyoLeave Limelight!
augroup END
" }}}
" }}}
