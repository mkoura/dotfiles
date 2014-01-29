" Ycm shortcuts
"nnoremap <buffer> <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" rope shortcuts
"nnoremap <buffer> <C-c>g :call RopeGotoDefinition()<CR>
"nnoremap <buffer> <C-c>d :call RopeShowDoc()<CR>
"nnoremap <buffer> <C-c>f :call RopeFindOccurrences()<CR>

" set vertical column to mark 80 characters
if exists('+colorcolumn')
	setlocal colorcolumn=81
else
	au! BufEnter <buffer> match ColorColumn /\%80v.*/
endif

" use 4 spaces for indentation
setlocal expandtab shiftround tabstop=4 shiftwidth=4 softtabstop=4
