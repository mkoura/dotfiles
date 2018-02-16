let g:startup_dir = expand('%:p:h')

" only load when vim started in cfme tests repo
if g:startup_dir !~? 'cfme_tests'
  finish
endif

command! Cfme :exe 'lcd ' . g:startup_dir

augroup cfme_tests
  autocmd!
  " write command for running current test (depends on vim-slime and TagBar and
  " expects to be in test function)
  au BufRead,BufNewFile */cfme/tests/*.py nnoremap <buffer> <silent> <nowait> <localleader>rt :exe
        \ 'SlimeSend0 "cfme_pytest_cache -s -k ' . tagbar#currenttag('%s', '')
        \ . ' ' . expand('%') . '"'<CR>
augroup END
