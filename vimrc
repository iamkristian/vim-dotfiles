call pathogen#infect()
call pathogen#helptags()
set nocompatible
set smartindent
set tabstop=4
set shiftwidth=4
set showmatch
set vb t_vb=
set ruler
set nohls
set incsearch
set virtualedit=all
" colors and fonts
syntax enable
" Set font according to system
filetype plugin indent on
if has("gui_running")
  set guioptions-=T
  set t_Co=256
  set background=dark
  colorscheme vimmynights
  set nonu
else
  set t_Co=256
  colorscheme vimmynights
  set background=dark
  set nonu
endif

set encoding=utf8
set ffs=unix,mac,dos "Default file types
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"Persistent undo
try
if 	MySys() == "windows"
	set undodir=C:\Windows\Temp

else
	set undodir=~/.vim_runtime/undodir
endif
    set undofile
catch
endtry
" Clojure setup
let g:slimv_swank_clojure = '! xterm -e lein swank &' 
let vimclojure#FuzzyIndent = 1

" Cursor setup
highlight Cursor guifg=white guibg=blue
highlight iCursor guifg=white guibg=red
"set guicursor=n-v-c:block-Cursor
set guicursor=n-v-c:ver100-Cursor
set guicursor+=i:ver100-iCursor
"set guicursor+=n-v-c:blinkon0
set guicursor+=n-v-c:blinkwait10
set guicursor+=i:blinkwait10

if &term =~ "xterm\\|rxvt|cygwin|xterm-256color"
	" use an orange cursor in insert mode
	let &t_SI = "\<Esc>]12;red\x7"
	" use a red cursor otherwise
	let &t_EI = "\<Esc>]12;blue\x7"
	silent !echo -ne "\033]12;red\007"
	" reset cursor when vim exits
	autocmd VimLeave * silent !echo -ne "\033]112\007"
	" use \003]12;gray\007 for gnome-terminal
endif

" Vimdiff options
set diffopt=iwhite
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
"improve autocomplete menu color
"highlight Pmenu ctermbg=238 gui=bold


"
" Command-T mappings
"
nnoremap <silent> <C-t> :CommandT<CR>
let g:CommandTMaxHeight=12
let g:CommandTMatchWindowReverse=1
let g:CommandTMaxFiles=40000
