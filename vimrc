" 
" Setup pathogen
"
runtime bundle/vim-pathogen/autoload/pathogen.vim
set t_Co=256
call pathogen#infect()
call pathogen#helptags()
colorscheme vimmynights
set background=dark
"
" Setup tabs and indent
"
set nocompatible
set smartindent
set tabstop=2
set shiftwidth=2
set showmatch
set vb t_vb=
set ruler
set nohls
set incsearch
set number
set virtualedit=all
"
" Colors and fonts
"
syntax enable
filetype plugin indent on
if has("gui_running")
  set guioptions-=T
endif
"
" Set default file encoding and file type
"
set encoding=utf8
set ffs=unix,mac,dos "Default file types
"
" Turn backup off, since most stuff is in SVN, git anyway...
"
set nobackup
set nowb
set noswapfile
"
" Persistent undo
"
try
if 	MySys() == "windows"
	set undodir=C:\Windows\Temp
else
	set undodir=~/.vim_runtime/undodir
endif
    set undofile
catch
endtry
"
" Cursor setup
"
set guicursor=n-v-c:block-Cursor
set guicursor=n-v-c:ver100-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=n-v-c:blinkwait10
set guicursor+=i:blinkwait10
"
" Clojure setup
"
let g:slimv_swank_clojure = '! xterm -e lein swank &' 
let vimclojure#FuzzyIndent = 1

" Vimdiff options
set diffopt=iwhite
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"
" Command-T mappings
"
nnoremap <silent> <C-t> :CommandT<CR>
let g:CommandTMaxHeight=12
let g:CommandTMatchWindowReverse=1
let g:CommandTMaxFiles=40000
