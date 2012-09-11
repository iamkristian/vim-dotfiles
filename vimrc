"
" Setup pathogen, and colors
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
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start
set showmatch
set vb t_vb=
set ruler
set nohls
set incsearch
set number
set virtualedit=all
set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y[%{strlen(&fenc)?&fenc:'none'},%{&ff}]\ %{fugitive#statusline()}\ %{rvm#statusline()}%=%-16(\ %l,%c-%v\ %)%P
"
" Colors and fonts
"
syntax enable
filetype plugin indent on
if has("gui_running")
  set guioptions-=T
endif
"
" Set default file encoding and file types
"
set encoding=utf8
set ffs=unix,mac,dos
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
if MySys() == "windows"
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
"
" Vimdiff options
"
set diffopt=iwhite
"
" Textmate snippets
"
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"
" CTRL-p mappings
"
let g:ctrlp_switch_buffer=2
let g:ctrlp_open_new_file='t'
let g:ctrlp_open_multiple_files='t'
"
" Extra whitespaces
"
autocmd BufWinEnter * match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd BufWritePre *.rb,*.js,*.erb,*.scss,*.md :%s/\s\+$//e
"
" Automatic remove trailing spaces
"
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
"autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
