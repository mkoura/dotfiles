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

" Install: git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" installed bundles
Plugin 'KabbAmine/zeavim.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'MarcWeber/vim-addon-local-vimrc'
Plugin 'SirVer/ultisnips'
" Install: './install.sh --clang-completer --gocode-completer --tern-completer' in ./
" and 'npm install typescript' for TypeScript support
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'benmills/vimux'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Python handled by YCM
"Plugin 'davidhalter/jedi-vim'
" Install: apt-get install silversearcher-ag (dnf install the_silver_searcher)
Plugin 'ervandew/ag'
" Install: 'git clone https://github.com/matthewsimo/angular-vim-snippets.git'
" in bundles root
Plugin 'honza/vim-snippets'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'kien/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'luochen1990/rainbow'
" Install: apt-get install exuberant-ctags (dnf install ctags)
Plugin 'majutsushi/tagbar'
" Install: 'npm install' in ./
"Plugin 'marijnh/tern_for_vim'
Plugin 'mkitt/tabline.vim'
" use instead of 'jmcantrell/vim-virtualenv' until PYTHONPATH fixed
"Plugin 'mkoura/vim-virtualenv'
Plugin 'moll/vim-node'
Plugin 'myusuf3/numbers.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/Gundo'
Plugin 'vim-scripts/vcscommand.vim'

call vundle#end()
filetype plugin indent on

" }}}


" Plugins config {{{

"
" Nerdtree
"
nnoremap <F2> :NERDTreeToggle<CR>
"let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1


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
" disable for selected formats
let g:ycm_filetype_blacklist={
  \ 'tagbar' : 1,
  \ 'qf' : 1,
  \ 'notes' : 1,
  \ 'markdown' : 1,
  \ 'unite' : 1,
  \ 'text' : 1,
  \ 'vimwiki' : 1,
  \ 'pandoc' : 1
  \}

" tell ycmd to use Python2 even in Python3 venvs
let g:ycm_server_python_interpreter='/usr/bin/python'

" enable completion from tags
"let g:ycm_collect_identifiers_from_tags_files=1
" fallback path to a compilation flags config file
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'

" open new tab when we have to move to a different file
let g:ycm_goto_buffer_command='new-tab'


"
" jedi-vim
"
""let g:jedi#popup_on_dot=0
"let g:jedi#goto_definitions_command='<C-]>'
"let g:jedi#goto_assignments_command='<leader>ja'
"let g:jedi#rename_command='<leader>re'
"let g:jedi#usages_command='<C-^>'


"
" Tern for Vim
"
" display argument type hints
" when the cursor is left over a function
"let g:tern_show_argument_hints='on_hold'


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


"
" Rope
"
"source ~/Source/repos/rope/rope.vim
"let ropevim_enable_shortcuts=0 " disable default shortcuts
"let ropevim_goto_def_newwin=1  " open external definitions in new buffer


"
" Syntastic
"
let g:syntastic_python_flake8_args='--max-line-length=100'
"let g:syntastic_python_checkers=['pylint', 'flake8']
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_exec = 'flake8p'
let g:syntastic_disabled_filetypes = ['java']


"
" vim-airline
"
set laststatus=2 " show statusline all the time
let g:airline_theme='solarized' " make sure solarized is used
let g:airline_powerline_fonts=1 " 'apt-get install fonts-powerline' first


"
" Rainbow Parentheses Improved
"
let g:rainbow_active = 1
" solarized compatible colors
let g:rainbow_conf = {
  \   'ctermfgs': ['brown', 'Darkblue', 'darkgray', 'darkgreen'],
  \   'guifgs': ['RoyalBlue3', 'SeaGreen3', 'DarkOrchid3', 'firebrick3'],
  \}


" load matchit
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
  set background=light
  "set background=dark
  colorscheme solarized
endif

" }}}


" Sets {{{

set directory=~/.vim/swap// " where to save swap files
set undodir=~/.vim/undo//   " where to save undo histories
set undofile " persistent undo
set undolevels=500  " maximum number of changes that can be undone
set undoreload=5000 " maximum number lines to save for undo on a buffer reload
set history=1000 " mum of entries remembered for ':' commands and search patterns
set cursorline " highlight line with cursor
"set cursorcolumn " highlight column with cursor
set showcmd " show that vim is waiting for key
set scrolloff=3 " min number of lines to keep above and below the cursor
set backspace=indent,eol,start " backspace for dummies
set number " line numbers on
set incsearch " search as characters are entered
set hlsearch " highlight search terms
"set mouse=a " set mouse=a
set hidden " switch files without saving them first
set clipboard=unnamedplus " use + register for copy-paste
"set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " highlight problematic whitespace
set pastetoggle=<leader>pt " pastetoggle (sane indentation on pastes)
set switchbuf+=usetab,newtab " switch to existing tab or use new tab
set lazyredraw " redraw only when we need to
set completeopt-=preview " turn off the preview window

" bash-like tab completion
"set wildmode=longest:full,list,full
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


" Autocommands {{{

augroup configgroup
  autocmd!

  " YouCompleteMe
  au FileType c,cpp,python,typescript,javascript nnoremap <buffer> <C-]> :YcmCompleter GoTo<CR>
  au FileType c,cpp,python,typescript,javascript nnoremap <buffer> <leader>ja :YcmCompleter GoToDefinition<CR>
  au FileType c,cpp,python,typescript,javascript nnoremap <buffer> <leader>gd :YcmCompleter GetDoc<CR>
  au FileType c,cpp,typescript,javascript nnoremap <buffer> <leader>gt :YcmCompleter GetType<CR>
  au FileType javascript nnoremap <buffer> <leader>re :YcmCompleter RefactorRename<CR>
  au FileType c,cpp nnoremap <buffer> <leader>fx :YcmCompleter FixIt<CR>

  " Tern for Vim (Javascript)
  "au FileType javascript nnoremap <buffer> <C-]> :TernDefTab<CR>
  "au FileType javascript nnoremap <buffer> <C-@> :TernDefPreview<CR>
  "au FileType javascript nnoremap <buffer> <C-^> :TernRefs<CR>
  "au FileType javascript nnoremap <buffer> <leader>re :TernRename<CR>
  "au FileType javascript nnoremap <buffer> <leader>tt :TernType<CR>
  "au FileType javascript nmap <buffer> <S-k> :TernDoc<CR>

  " Tsuquyomi (Typescript)
  "au FileType typescript nnoremap <buffer> <leader>re :TsuquyomiRenameSymbol<CR>
  "au FileType typescript nnoremap <buffer> <leader>tt : <C-u>echo tsuquyomi#hint()<CR>
  "au FileType typescript nmap <buffer> <S-k> : <C-u>echo tsuquyomi#hint()<CR>

  " Rainbow Parentheses Improved - workaround to make it work with
  " pangloss/vim-javascript
  au FileType javascript syntax clear jsFuncBlock

  " vertical bar after 80th character
  au FileType c,cpp,go,python,sh,javascript,java,typescript setlocal colorcolumn=81

  " indentation
  au FileType c,cpp,go,ant,xml,html,python,tex setlocal expandtab shiftround tabstop=4 shiftwidth=4 softtabstop=4
  au FileType sh,javascript,java,typescript,vim setlocal expandtab shiftround tabstop=2 shiftwidth=2 softtabstop=2

  " restore last position in file when reopened
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

  " used for swapping to the last viewed tab - see shortcuts
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

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" save session
nnoremap <leader>ss :mksession<CR>

" allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" for when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" change Working Directory to that of the current file
cmap cd. lcd %:p:h

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
