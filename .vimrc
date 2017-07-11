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
Plugin 'airblade/vim-gitgutter'
Plugin 'airblade/vim-rooter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'danro/rename.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'godlygeek/tabular' " required for plasticboy/vim-markdown
Plugin 'jpalardy/vim-slime'
Plugin 'easymotion/vim-easymotion'
Plugin 'luochen1990/rainbow'
" Install: apt-get install exuberant-ctags (dnf install ctags)
Plugin 'majutsushi/tagbar'
Plugin 'MarcWeber/vim-addon-local-vimrc'
Plugin 'myusuf3/numbers.vim'
Plugin 'plasticboy/vim-markdown'
" Install: apt-get install silversearcher-ag (dnf install the_silver_searcher)
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rhubarb'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on

" }}}


" Plugins config {{{


"
" Python with virtualenv support
"
if ! has('gui_running')
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
" Gundo
"
nnoremap <F4> :GundoToggle<CR>


"
" Tagbar
"
nnoremap <F8> :TagbarToggle<CR>


"
" Ag
"
"nnoremap <leader>gr :split<CR>:Ag '\b<cword>\b'<CR>
nnoremap <leader>gr :Ag '\b<cword>\b'<CR>


"
" netrw
"
nnoremap <F2> :Explore<CR>


"
" jedi-vim
"
" for use with neocomplete
let g:jedi#completions_enabled=0
let g:jedi#auto_vim_configuration=0
let g:jedi#smart_auto_mappings=0

" display function call signatures in command line
set noshowmode
let g:jedi#show_call_signatures=2

let g:jedi#goto_command='<C-]>'
let g:jedi#goto_assignments_command='<leader>jd'
let g:jedi#goto_definitions_command=''
let g:jedi#documentation_command='<leader>gd'
let g:jedi#usages_command='<leader>jr'
let g:jedi#rename_command='<leader>re'


"
" neocomplete
"
let g:neocomplete#enable_at_startup=1
let g:neocomplete#enable_smart_case=1
let g:neocomplete#sources#syntax#min_keyword_length=3

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <Up>, <Down>" : completion.
inoremap <expr><Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><Up> pumvisible() ? "\<C-p>" : "\<Up>"

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns={}
endif
let g:neocomplete#force_omni_input_patterns.python='\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
"let g:neocomplete#force_omni_input_patterns.ruby='[^. *\t]\.\w*\|\h\w*::'


"
" neosnippet
"
" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-j> <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


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
let g:syntastic_mode_map={ 'mode': 'active', 'passive_filetypes': ['java', 'markdown'] }
" to be able to use :lnext and :lprev
let g:syntastic_always_populate_loc_list=1


"
" vim-slime
"
let g:slime_target='tmux'
let g:slime_default_config={'socket_name': 'default', 'target_pane': ':.1'}
let g:slime_python_ipython=1


"
" vim-airline
"
set laststatus=2 " show statusline all the time
let g:airline_theme='solarized' " make sure solarized is used
let g:airline_powerline_fonts=1 " apt-get install fonts-powerline (dnf install powerline-fonts)
let g:airline_exclude_preview=1 " disble for preview windows
let g:airline#extensions#tabline#enabled=1 " list of buffers
let g:airline#extensions#tabline#fnamemod=':t' " show just the filename
let g:airline#extensions#tabline#tab_nr_type=1 " show tab numbers


"
" vim-rooter
"
let g:rooter_use_lcd=1
let g:rooter_silent_chdir=1


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
" vim-markdown
"
" header folding level
let g:vim_markdown_folding_level=4


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
"set mouse=a " enable mouse for all modes
set hidden " switch files without saving them first
set clipboard=unnamedplus " use + register for copy-paste
set pastetoggle=<leader>pt " pastetoggle (sane indentation on pastes)
set switchbuf=split " use new split
set lazyredraw " redraw only when we need to
"set completeopt-=preview " turn off the preview window
set autoindent " copy indent from current line when starting a new line
set smarttab " insert configured number of blanks on <Tab>
set ruler " show the line and column number of the cursor position
set autoread " automatically read again changed files
set ttimeout " time out on key codes
set ttimeoutlen=800
set tabpagemax=50 " maximum number of tab pages
set display+=lastline " display as much as possible of the last line
set formatoptions+=j " delete comment character when joining commented lines
set nrformats-=octal " numbers starting with zero will NOT be considered octal
set wmh=0 " don't show one line of minimized split
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab " use spaces instead of tabs

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

" spellchecking in current buffer
command! SpellEN :setlocal spell spelllang=en_us
command! SpellOff :setlocal nospell

" R = command output in new tab
command! -nargs=* -complete=shellcmd Rr tabnew<Bar>setlocal buftype=nofile bufhidden=hide noswapfile nowrap<Bar>0r !<args>
command! -nargs=* -complete=shellcmd R  tabnew<Bar>setlocal buftype=nofile bufhidden=hide noswapfile nowrap<Bar>execute '0r !<args>'<Bar>filetype detect

" }}}


 " Autocommands {{{

augroup configgroup
  autocmd!

  au FileType css setlocal omnifunc=csscomplete#CompleteCSS
  au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  au FileType python setlocal omnifunc=jedi#completions
  "au FileType ruby setlocal omnifunc=rubycomplete#Complete
  au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  " rainbow plugin - workaround to make it work with pangloss/vim-javascript
  "au FileType javascript syntax clear jsFuncBlock

  " vertical bar after 100th character
  au FileType c,cpp,go,python,sh,javascript,java,typescript,ruby setlocal colorcolumn=101

  " indentation
  au FileType make setlocal noexpandtab " use real tabs for Makefiles
  au FileType sh,vim,ruby setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

  " override 'switchbuf' for quickfix windows
  au FileType qf setlocal switchbuf=useopen

  " word wrapping for text files
  au FileType txt,markdown,tex setlocal wrap linebreak nolist textwidth=0 wrapmargin=0

  " don't conceal quotes in JSON
  au FileType json setlocal conceallevel=0

  " restore last position in file when reopened
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " used for swapping to the last viewed tab - see Key mappings
  au TabLeave * let g:lasttab=tabpagenr()
augroup END

" }}}


" Key mappings {{{

" fix Alt key in console
" for mapped keys
if ! has('gui_running')
  set <M-h>=h
  set <M-j>=j
  set <M-k>=k
  set <M-l>=l
  set <M-t>=t
endif

" split navigations
nnoremap <M-j> <C-W><C-J>
nnoremap <M-k> <C-W><C-K>
nnoremap <M-l> <C-W><C-L>
nnoremap <M-h> <C-W><C-H>

" moving lines up and down
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" swap to the last viewed tab
" http://stackoverflow.com/questions/2119754/switch-to-last-active-tab-in-vim
let g:lasttab=1
nmap <M-t><M-t> :exe 'tabn '.g:lasttab<CR>
imap <M-t><M-t> <ESC>:exe 'tabn '.g:lasttab<CR>

" move tab to right
nmap <M-t><M-l> :tabm +1<CR>
" move tab to left
nmap <M-t><M-h> :tabm -1<CR>

" new tab
nnoremap <leader>tt :$tabnew<CR>

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" search for visually selected text
vnoremap // y/<C-R>"<CR>

" highlight word without jumping
nnoremap * *``

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
nmap <Leader>ff [I:let nr = input('Which one: ')<Bar>exe 'normal ' . nr .'[\t'<CR>

" for when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" change Working Directory to that of the current file
cmap cd. lcd %:p:h

" }}}
