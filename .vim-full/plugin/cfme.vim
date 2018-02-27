augroup cfme_tests
  autocmd!
  " run current test in tmux pane (depends on vim-slime and TagBar
  " and expects to be in test function)
  au BufRead,BufNewFile */cfme/tests/*.py command! -buffer -nargs=* Pytest :exe
        \ 'SlimeSend0 "cfme_pytest_cache -s -k ' . tagbar#currenttag('%s', '')
        \ . ' ' . expand('%') . ' ' . <q-args> . '\r"'
augroup END
