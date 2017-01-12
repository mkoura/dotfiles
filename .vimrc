" Initial config {{{
" vim:foldmethod=marker:foldlevel=0

" character encoding used inside Vim
"scriptencoding utf-8
"set encoding=utf-8

set nocompatible

" remap <leader> to ,
let mapleader=',' " remap <leader>

" }}}


" Plugins {{{

" Install: git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" installed bundles
Plugin 'alfredodeza/coveragepy.vim'
"Plugin 'fatih/vim-go'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
" Install: 'git clone https://github.com/matthewsimo/angular-vim-snippets.git'
" in bundles root
Plugin 'honza/vim-snippets'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'KabbAmine/zeavim.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'luochen1990/rainbow'
" Install: apt-get install exuberant-ctags (dnf install ctags)
Plugin 'majutsushi/tagbar'
Plugin 'MarcWeber/vim-addon-local-vimrc'
Plugin 'mkitt/tabline.vim'
Plugin 'moll/vim-node'
Plugin 'myusuf3/numbers.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
" Install: apt-get install silversearcher-ag (dnf install the_silver_searcher)
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'sjl/gundo.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-surround'
" Install: './install.py --tern-completer' in ./
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'xolox/vim-misc' " required for vim-easytags
Plugin 'xolox/vim-easytags'

call vundle#end()
filetype plugin indent on

" }}}


" Plugins config {{{


"
" Python with virtualenv support
"
if ! has("gui_running")
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  try:
    execfile(activate_this, dict(__file__=activate_this))
  except IOError:
    pass
EOF
endif


"
" NERDTree
"
let NERDTreeShowHidden=1
"let NERDTreeQuitOnOpen=1

" show dir of current file
"nnoremap <F2> :NERDTreeToggle %<CR>

" show current file in tree
function! NERDTreeFindToggle()
  if g:NERDTree.IsOpen()
    call g:NERDTree.Close()
  else
    :NERDTreeFind
  endif
endfunction
nnoremap <F2> :call NERDTreeFindToggle()<CR>


"
" Gundo
"
nnoremap <F4> :GundoToggle<CR>


"
" Tagbar
"
nnoremap <F8> :TagbarToggle<CR>


"
" YouCompleteMe
"
" tell ycmd to use Python2 even in Python3 venvs
"let g:ycm_server_python_interpreter='/usr/bin/python2'

" fallback path to a compilation flags config file
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

" open new tab when we have to move to a different file
let g:ycm_goto_buffer_command='new-tab'

" collect also identifiers from tags files
let g:ycm_collect_identifiers_from_tags_files=1


"
" easytags
"
let g:easytags_opts=['--fields=+l']


"
" UltiSnips
"
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardTrigger='<c-k>'
let g:UltiSnipsListSnippets='<c-e>'
let g:UltiSnipsEditSplit='vertical'
"let g:UltiSnipsUsePythonVersion=2


"
" CtrlP
"
let g:ctrlp_max_files=50000
let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
let g:ctrlp_switch_buffer='Et'


"
" Syntastic
"
let g:syntastic_python_flake8_args='--max-line-length=100'
let g:syntastic_python_checkers=['pylint', 'flake8']
let g:syntastic_go_checkers=['gofmt', 'govet']
let g:syntastic_mode_map={ 'mode': 'active', 'passive_filetypes': ['java'] }
" to be able to use :lnext and :lprev
let g:syntastic_always_populate_loc_list=1


"
" vim-go
"
" Issue with vim-go and syntastic is that the location list window that
" contains the output of commands such as :GoBuild and :GoTest might not
" appear. To resolve this:
"let g:go_list_type="quickfix"

" additional highlighting
"let g:go_highlight_functions=1
"let g:go_highlight_methods=1
"let g:go_highlight_structs=1
"let g:go_highlight_interfaces=1
"let g:go_highlight_operators=1
"let g:go_highlight_build_constraints=1

" don't :GoFmt automatically on save, let Syntastic take care of it
"let g:go_fmt_autosave=0


"
" vim-airline
"
set laststatus=2 " show statusline all the time
let g:airline_theme='solarized' " make sure solarized is used
let g:airline_powerline_fonts=0 " 'apt-get install fonts-powerline' first


"
" Rainbow Parentheses Improved
"
let g:rainbow_active=1
" solarized compatible colors
let g:rainbow_conf={
  \   'ctermfgs': ['brown', 'Darkblue', 'darkgray', 'darkgreen'],
  \   'guifgs': ['RoyalBlue3', 'SeaGreen3', 'DarkOrchid3', 'firebrick3'],
  \}


"
" matchit
"
runtime macros/matchit.vim

" }}}


" Colors {{{

" highlight extra whitespace
" MUST be inserted BEFORE the colorscheme command
augroup colorsgrp
  autocmd!
  au ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
  au InsertLeave * match ExtraWhitespace /\s\+$/
augroup END

syntax enable
if &term=~'linux'
  set background=dark
else
  "set t_Co=256
  "set background=light
  set background=dark
  colorscheme solarized
endif

" }}}


" Sets {{{

" https://github.com/tpope/vim-sensible/blob/master/plugin/sensible.vim

set directory=~/.vim/swap// " where to save swap files
set undodir=~/.vim/undo//   " where to save undo histories
set undofile " persistent undo
set undolevels=500  " maximum number of changes that can be undone
set undoreload=5000 " maximum number lines to save for undo on a buffer reload
set history=1000 " mum of entries remembered for ':' commands and search patterns
set cursorline " highlight line with cursor
set showcmd " show that vim is waiting for key
set scrolloff=3 " min number of lines to keep above and below the cursor
set sidescrolloff=5 " min number of columns to keep to sides
set backspace=indent,eol,start " backspace for dummies
set number " line numbers on
set incsearch " search as characters are entered
set hlsearch " highlight search terms
"set mouse=a " set mouse=a
set hidden " switch files without saving them first
set clipboard=unnamedplus " use + register for copy-paste
set pastetoggle=<leader>pt " pastetoggle (sane indentation on pastes)
set switchbuf=usetab,newtab " switch to existing tab or use new tab
set lazyredraw " redraw only when we need to
set completeopt-=preview " turn off the preview window
set autoindent " copy indent from current line when starting a new line
set smarttab " insert configured number of blanks on <Tab>
set ruler " show the line and column number of the cursor position
set autoread " automatically read again changed files
set ttimeout " time out on key codes
set ttimeoutlen=100
set tabpagemax=50 " maximum number of tab pages
set display+=lastline " display as much as possible of the last line
set formatoptions+=j " delete comment character when joining commented lines
set nrformats-=octal " numbers starting with zero will NOT be considered octal

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if !empty(&viminfo)
  set viminfo^=!
endif

" bash-like tab completion
set wildmode=list:longest,full
set wildmenu
set wildignore=*~,*.bak,*.o,*.aut,*.dvi

" don't save backup files
set nobackup
set nowritebackup

" highlight matching bracket
set showmatch
set matchpairs=(:),[:],{:},<:>

" sessions
set ssop-=options " do not store global and local values in a session
set ssop-=folds   " do not store folds

" }}}


" Commands {{{

" Rmw = remove trailing whitespaces and ^M chars
command! Rmw %s/\s\+$//e

" background settings
command! Bglight :set background=light
command! Bgdark :set background=dark

" R = command output in new tab
command! -nargs=* -complete=shellcmd Rr tabnew | setlocal buftype=nofile bufhidden=hide noswapfile nowrap | 0r !<args>
command! -nargs=* -complete=shellcmd R  tabnew | setlocal buftype=nofile bufhidden=hide noswapfile nowrap | execute '0r !<args>' | filetype detect

" }}}


 " Autocommands {{{

augroup configgroup
  autocmd!

  " YouCompleteMe plugin
  au FileType python,javascript nnoremap <buffer> <C-]> :YcmCompleter GoTo<CR>
  au FileType python,javascript nnoremap <buffer> <leader>ja :YcmCompleter GoToDefinition<CR>
  au FileType python,javascript nnoremap <buffer> <leader>gd :YcmCompleter GetDoc<CR>
  au FileType javascript nnoremap <buffer> <leader>gt :YcmCompleter GetType<CR>
  au FileType javascript nnoremap <buffer> <leader>re :YcmCompleter RefactorRename<CR>

  " vim-go plugin
  "au FileType go nmap <buffer> <C-]> <Plug>(go-def-tab)
  "au FileType go nmap <buffer> <leader>re <Plug>(go-rename)

  " rainbow plugin - workaround to make it work with pangloss/vim-javascript
  au FileType javascript syntax clear jsFuncBlock

  " vertical bar after 100th character
  au FileType c,cpp,go,python,sh,javascript,java setlocal colorcolumn=101

  " indentation
  au FileType c,cpp,go,ant,xml,html,python,tex setlocal expandtab shiftround tabstop=4 shiftwidth=4 softtabstop=4
  au FileType sh,javascript,java,vim setlocal expandtab shiftround tabstop=2 shiftwidth=2 softtabstop=2

  " override 'switchbuf' for quickfix windows
  au FileType qf setlocal switchbuf=usetab

  " restore last position in file when reopened
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " used for swapping to the last viewed tab - see Key mappings
  au TabLeave * let g:lasttab=tabpagenr()
augroup END

" }}}


" Key mappings {{{

" fix Alt key in console
" for mapped keys
if ! has("gui_running")
  set <M-h>=h
  set <M-j>=j
  set <M-k>=k
  set <M-l>=l
  set <M-t>=t
endif

" swap to the last viewed tab
" http://stackoverflow.com/questions/2119754/switch-to-last-active-tab-in-vim
let g:lasttab=1
nmap <M-t><M-t> :exe "tabn ".g:lasttab<CR>

" move tab to right
nmap <M-t><M-l> :tabm +1<CR>
" move tab to left
nmap <M-t><M-h> :tabm -1<CR>

" moving lines up and down
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" recoverable undo
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" display all lines with keyword under cursor and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" for when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" change Working Directory to that of the current file
cmap cd. lcd %:p:h

" }}}
