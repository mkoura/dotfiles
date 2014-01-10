nnoremap <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
if exists('+colorcolumn')
	setlocal colorcolumn=81
else
	au! BufEnter <buffer> match ColorColumn /\%81v.*/
endif
