setlocal formatoptions+=a
setlocal makeprg=pandoc\ -t\ pdf

setlocal spell spellcapcheck=
nnoremap <buffer> <localleader>p [s
nnoremap <buffer> <localleader>n ]s
