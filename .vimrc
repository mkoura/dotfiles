set nocompatible

" syntax highlighting
syntax enable
if &term=~'linux'
  set background=dark
else
  "set t_Co=256
  "set background=light
  set background=dark
  colorscheme solarized
endif

" show that vim is waiting for key
set showcmd

" bash-like tab completion
set wildmode=longest,list,full
set wildmenu
set wildignore=*~,*.bak,*.o,*.aut,*.dvi
