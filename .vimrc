"vim -u NONE <filename>     "start with no plugins
"vim -u NORC <filename>     "start with plugins but not ~/.vimrc

set nocompatible            "not vi compatible. put first


" settings {{{

"formatting based on filetype
"Helps force plugins to load correctly when it is turned back on below
filetype off
filetype plugin on

if !exists("g:syntax_on")   "syntax coloring
    syntax enable 
endif

"fix python tabs. applies to some other filetypes too
"place after "filetype plugin on"
"":verbose set tabstop" to check where last tabstop was set
"add future occurrences here
""grep -r setlocal /usr/share/vim/vim80/{ftplugin,indent,syntax}"
"for list of other occurrences
augroup python
    autocmd!
    autocmd FileType python setlocal ts=4 sts=4 sw=4
augroup end

set ttyfast                 "rendering
set lazyredraw

let $BASH_ENV = "~/.bash_aliases"       "bash aliases in external commands

set encoding=utf-8          "change file encoding

"ignore these files when opening based on a pattern
set wildignore+=.pyc,.swp,.git,.o,.svn,.hi,.class,.DS_Store,.bak,~

set noerrorbells            "no beep on errors
set novisualbell

" }}}


" editing {{{

set copyindent              "copies previous lines' indentation
set preserveindent          "tries to keep current line's indentation when changed.

set tabstop=4               "tab is 4 spaces
set softtabstop=4           "<bs> deletes entire tab instead of one space
set shiftwidth=4            "when indenting with '>', use 4 spaces width
set expandtab               "converts tabs to spaces
set shiftround              "multiple of shiftwidth when indenting with '<' and '>'
"set smarttab               "tabs follow shiftwidth not tabstop at beginning of line

"set wrap                   "line wrap matches indentation
set breakindent
set autoindent              "next line matches previous line indentation
set nocindent               "avoid certain indentations
set smartindent             "I use for tab after braces

set linebreak               "avoid wrapping a line in the middle of a word
let &showbreak='> '         "mark to show wrapped from previous line

set textwidth=100           "max length of a line

"set virtualedit=onemore    "go one char past line

"set list                   "showing white space
"set listchars=tab:>-,eol:$

set backspace=indent,eol,start      "backspace through everything

set scrolloff=3             "buffer lines from cursor to top and bottom of screen
"set scrolloff=999          "always centered

set nofoldenable            "disable folding

set nrformats=bin,hex       "remove octal

" }}}


" windows {{{

set splitright              "split pane right
set splitbelow              "split pane below

set confirm                 "normal exit options on unsaved write

set showmode                "shows mode
set showcmd                 "shows incomplete commands

set title                   "show title

set ruler                   "display cursor

"set hidden                 "easier hiding unsaved buffers

" }}}


" searching {{{

set ignorecase              "search ignoring case
set smartcase               "search not ignoring case when entered caps
set incsearch               "search while entering
set hlsearch                "highlight search

set wildmenu                "better autocomplete
set wildmode=list:longest,full          "search pattern

set history=200             "increase stored history

set number                  "display line numbers and change colors
highlight LineNr ctermfg=darkgrey
"set relativenumber         "line number relative to the current

" }}}


" key mappings {{{

set whichwrap+=<,>,h,l,[,]  "h, l, left, right keys can move back and forward lines

"for wrapped lines. up and down in visual lines not line numbers
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up>   gk

"switching windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

"enter shell
nnoremap ! :!

"tabs
nnoremap > >>
nnoremap < <<

"jk for escape
imap jk <esc>

"switch semicolon and colon
nnoremap ; :
nnoremap : ;

"map space to leader
nnoremap <space> zZ
let mapleader = "\<space>"
set timeoutlen=500         "lowers leader key delay

"remove hlsearch and reload screen
nnoremap <leader>r :noh<cr>:redr!<cr>

set wildcharm=<tab>         "mapping tab as autocomplete in command mode

"switching tabs
nnoremap <tab> gt
nnoremap <s-tab> gT

"new tab
"nnoremap <leader><tab> :call feedkeys(":tabe \<tab>", 'tn')<cr>
nnoremap <leader><tab> :tabe <tab>

"select buffer
nnoremap , :b <tab>

"open new file
nnoremap <leader>, :e <tab>

"new vertical split
nnoremap <leader><bs> :vs <tab>

"next window
nnoremap <bs> <c-w>w

"nvim: leave terminal
try
    tnoremap <esc> <c-\><c-n>
catch
endtry

"same as "o" but stay in normal mode
nnoremap <cr> o<esc>

if has('mouse')             "use mouse features
    set mouse=a
endif

""""""""""unused""""""""""

"autocomplete in normal mode
"nnoremap <silent> , :call search('\w\>','cW')<cr>a<c-n>
"inoremap <silent> <expr> , pumvisible() ? "\<c-n>" : ","
"inoremap <silent><expr> <cr> pumvisible() ? "\<esc>" : "<cr>"

"switch windows, tabs, then buffers in order of priority when exist at least 2
"nnoremap <expr><silent> <tab> winnr('$')>1 ? "\<c-w>w" : (tabpagenr('$')>1 ? 'gt' : ":bn\<cr>")

"set matchpairs+=<:>        "% can jump between < and >

" }}}


" colors {{{

if has("termguicolors")
    set termguicolors
endif

"set t_Co=256                "gnome terminal colors
"set t_ut=
"set background=dark

"color theme
"https://github.com/chriskempson/base16-vim
"copy colors/base16-default-dark.vim to ~/.vim/colors/
try
    colorscheme base16-default-dark
catch
endtry

"use different colorscheme for java files
try
    "autocmd FileType java colorscheme monokai
    " Java: 'new', 'instanceof'
    autocmd FileType java highlight Operator ctermfg=5  guifg=#d175bc
    " Java: 'this', 'super'
    autocmd FileType java highlight Typedef ctermfg=5  guifg=#d175bc
    " Java: 'void', 'int', 'double'
    autocmd FileType java highlight Type ctermfg=4  guifg=#69b7d3
catch
endtry

" }}}


" startup {{{

"start at end of file
"autocmd VimEnter * :normal G

" }}}

