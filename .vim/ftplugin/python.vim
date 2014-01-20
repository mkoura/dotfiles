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

" add support for virtualenvs
python << EOF
import os
import sys
import vim

virtualenv = os.environ.get("VIRTUAL_ENV")
if virtualenv is not None:
    sys.path.insert(0, virtualenv)
    activate_this = os.path.join(virtualenv, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
