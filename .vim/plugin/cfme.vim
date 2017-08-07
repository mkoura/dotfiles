let g:startup_dir = expand('%:p:h')

if g:startup_dir =~ "cfme_tests"
  command! Cfme :exe 'lcd ' . g:startup_dir
  let g:syntastic_python_checkers=['flake8', 'pylint']
endif
