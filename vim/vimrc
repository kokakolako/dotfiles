" Be Vi IMproved!
set nocompatible

set rtp=$HOME/.config/vim/,/usr/share/vim/vimfiles,/usr/share/vim/vim74
runtime! bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect("bundle/{}", "src/{}")
execute pathogen#helptags()

if has('autocmd')
  filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

set autoindent
set encoding=utf-8
set backspace=indent,eol,start
set showcmd
set complete-=i
set smarttab
set nrformats-=octal
set shiftround
set ttimeout
set ttimeoutlen=100

if &t_Co > 2 || has("gui_running")
    set incsearch
    set t_Co=256
endif

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if has('mouse')
    set mouse=a
endif

set ruler		            " Show the cursor position all the time
set number                  " Show line numbers
set history=1000	        " Keep 1000 lines of command line history
set ignorecase              " Ignore case when searching
set smartcase               " No ignorecase if Uppercase char present
set laststatus=2            " Always display statusbar
set nobackup                " Do not keep a backup file
set title                   " Change terminal title to file name
set cursorline              " Highlight the current line
set lazyredraw              " Enable lazy redrawing to speed up macros
set expandtab               " Expand tabs to spaces
set softtabstop=4           " Control the colums which are used in insert-mode
set shiftwidth=4            " Set the identing tab width
set tabstop=4               " Changes the width of a tab
set undofile
set undodir=$HOME/.config/vim/undo
set wildmenu
set wildmode=full

if &tabpagemax < 50
  set tabpagemax=50
endif

if !empty(&viminfo)
  set viminfo^=!
endif

if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

source $HOME/.config/vim/keymappings.vim
source $HOME/.config/vim/plugins.vim
colorscheme molokai
set background=dark
