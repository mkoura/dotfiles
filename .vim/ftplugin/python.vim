" <leader>g for goto definition or declaration
nnoremap <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" set vertical column to mark 80 characters
if exists('+colorcolumn')
	setlocal colorcolumn=81
else
	au! BufEnter <buffer> match ColorColumn /\%80v.*/
endif

" use 4 spaces for indentation
setlocal expandtab tabstop=4 shiftwidth=4

" rope shortcuts
nnoremap <C-c>g :call RopeGotoDefinition()<CR>
nnoremap <C-c>d :call RopeShowDoc()<CR>
nnoremap <C-c>f :call RopeFindOccurrences()<CR>
