let g:startup_dir = expand('%:p:h')

if g:startup_dir =~ "cfme_tests"
  command! Cfme :exe 'lcd ' . g:startup_dir
endif
