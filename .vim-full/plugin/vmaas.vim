augroup vmaas_tests
  autocmd!
  " run current test in tmux pane (depends on vim-slime and TagBar
  " and expects to be in test function)
  au BufRead,BufNewFile */vmaas/tests/*.py command! -buffer -bang -nargs=* Pytest :exe
        \ 'SlimeSend0 "pytest -v -s ' . <q-args> .
        \ (<bang>0 ? '\r"'
        \          : ' -k ' . tagbar#currenttag('%s', '') . ' ' . expand('%') . '\r"')
augroup END
