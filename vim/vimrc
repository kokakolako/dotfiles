" Very defaults
set nocompatible                            " Be vImproved
set encoding=utf-8                          " Use UTF-8 to encode the text
set backspace=indent,eol,start              " Backspacing over everything
runtime macros/matchit.vim                  " Enable matchit.vim
filetype plugin indent on                   " Enable filetype-indenting

if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
    set fileencodings=ucs-bom,utf-8,latin1
endif

" Sourcing the splitted rc-files
source $HOME/.config/vim/keymappings.vim    " Sourcing keymappings
source $HOME/.config/vim/plugins.vim        " Sourcing plugins

" In many terminal emulators the mouse works just fine, thus enable it.
" if has('mouse')
"     set mouse=a
" endif

if &t_Co > 2 || has("gui_running")
    syntax on                               " Enable syntax-highlighting
    set incsearch                           " Enable incsearch to do use ranges
    set t_Co=256                            " Enable 256 colors
endif

if has("autocmd")
    augroup vimrcEx
    au!
    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " Jump to the last known cursor position
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

    augroup END
endif

" Misc
set history=1000	        " Keep 1000 lines of command line history
set ruler		            " Show the cursor position all the time
set showcmd		            " Display incomplete commands
set incsearch		        " Do incremental searching

set number                  " Show line numbers
set ignorecase              " Ignore case when searching
set smartcase               " No ignorecase if Uppercase char present
set laststatus=2            " Always display statusbar
set nobackup                " Do not keep a backup file
set title                   " Change terminal title to file name
set cursorline              " Highlight the current line
set lazyredraw              " Enable lazy redrawing to speed up macros

" Indenting
set autoindent		        " Always set autoindenting on
filetype plugin indent on   " Enable smart indenting

" Tab settings
set expandtab               " Expand tabs to spaces
set softtabstop=4           " Control the colums which are used in insert-mode
set shiftwidth=4            " Set the identing tab width
set tabstop=4               " Changes the width of a tab

" Permanent undo
set undofile
set undodir=~/.vim/undo

" Globbing Menu in the ex-mode
set wildmenu
set wildmode=full

