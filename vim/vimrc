" Be Vi IMproved!
set nocompatible

" Runtime path
set rtp+=$HOME/.config/vim
runtime! bundle/vim-pathogen/autoload/pathogen.vim

" Invoke Pathogen
silent! execute pathogen#infect("bundle/{}")
silent! execute pathogen#infect("src/{}")
silent! execute pathogen#helptags()

" Sourcing the other vim-config files
source $HOME/.config/vim/plugins.vim
source $HOME/.config/vim/keymappings.vim

" Filetype indenting + Syntax highlighting
filetype plugin indent on
syntax on

set autoindent                      " Enable auto-identing
set autowrite                       " Automatically write when changing buffer
set encoding=utf-8                  " Enable utf-8 encoding
set backspace=indent,eol,start      " Use backspace in insert-mode
set showcmd                         " Show the previous command
set smarttab                        " Expand tabs specific to the filetype
set shiftround                      " Round the shiftwidth
set ttimeout                        " Enable a timeout
set ttimeoutlen=100                 " Define the timeout length
set mouse=a                         " Enable mouse-support

if &t_Co > 2 || has("gui_running")
    set incsearch
    set t_Co=256
endif

colorscheme molokai                 " Set the colorscheme
set ruler		                    " Show the cursor position all the time
set number                          " Show line numbers
set history=1000	                " Keep 1000 lines of command line history
set ignorecase                      " Ignore case when searching
set smartcase                       " No ignorecase if Uppercase char present
set laststatus=2                    " Always display statusbar
set nobackup                        " Do not keep a backup file
set title                           " Change terminal title to file name
set cursorline                      " Highlight the current line
set lazyredraw                      " Enable lazy redrawing to speed up macros
set expandtab                       " Expand tabs to spaces
set softtabstop=4                   " Control the colums which are used in insert-mode
set shiftwidth=4                    " Set the identing tab width
set tabstop=4                       " Changes the width of a tab
set hidden                          " Now its possible to switch buffers without saving
set undofile                        " Undo-File for permanent undo
set undodir=$HOME/.config/vim/undo  " Change the path of the permanent-undo file
set wildmenu                        " Enable the wildmenu
set wildmode=list:longest,full      " Change the behaviour of wildmenu
set tabpagemax=50                   " Maximal 50 suggestions at tabcompletion

" Creating a viminfo-file
if !empty(&viminfo)
  set viminfo^=!
endif

" Enable matchit.vim
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

