" Vundle Settings
" --------------------------------------------------------

filetype off                  " required!

set rtp+=~/.config/vim/bundle/vundle/
call vundle#rc("~/.config/vim/bundle")

" let Vundle manage Vundle
Bundle "gmarik/vundle"

" Colorsheme
" --------------------------------------------------------

Bundle "altercation/vim-colors-solarized"
set background=dark     " Set a dark background
colorscheme solarized   " Set a colorsheme

" Airline (lightweight powerline alternative)
" --------------------------------------------------------

Bundle "bling/vim-airline"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#checks = [ "indent", "trailing" ]
let g:airline#extensions#whitespace#show_message = 1
" let g:airline_theme = "airlineish"

" Misc Plugins
" --------------------------------------------------------

" Highlight trailing whitespace
Bundle "ntpeters/vim-better-whitespace"

" Close tags automagically
Bundle "Townk/vim-autoclose"

" Open buffer more comfortable
Bundle "kien/ctrlp.vim"

" Something like Emmet for vim
Bundle "rstacruz/sparkup"

" Syntastic + Linter
Bundle "scrooloose/syntastic"
Bundle "dbakker/vim-lint"

" Sorting config-parameters
Bundle "godlygeek/tabular"
Bundle "suxpert/vimcaps"
Bundle "altercation/vim-colors-solarized"

" Great plugins from Tim Pope
Bundle "tpope/vim-abolish"
Bundle "tpope/vim-commentary"
Bundle "tpope/vim-eunuch"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-markdown"
Bundle "tpope/vim-obsession"
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-vinegar"

" Better 'f'-Command
Bundle "justinmk/vim-sneak"

"LaTeX Plugin
Bundle 'LaTeX-Box-Team/LaTeX-Box'

" Autocompletion
" Bundle "Valloric/YouCompleteMe"
" let g:ycm_autoclose_preview_window_after_completion=1
" let g:ycm_path_to_python_interpreter = '/usr/bin/python'

" Bundle "lilydjwg/colorizer"

" Plugins I don't use
" --------------------------------------------------------

"YankRing
" Bundle "YankRing.vim"

"Over.vim (Ersetzen wird grafisch vorgehoben)
" Bundle "osyo-manga/vim-over"

" Emmet
" Bundle "mattn/emmet-vim"

" Vimux
" Bundle "benmills/vimux"

" Unite
" Bundle "Shougo/unite.vim"

" Ack (a grep replacement)
" Bundle "mileszs/ack.vim"

" Neocomplcache
" Bundle "Shougo/neocomplcache.vim"

" Vimproc
" Bundle "Shougo/vimproc.vim"

" JavaScript Libaries Syntax-Higlighting
" Bundle "othree/javascript-libraries-syntax.vim"

" EasyMotion
" Bundle "Lokaltog/vim-easymotion"

" NERDtree
" Bundle "scrooloose/nerdtree"

" Sneak (better f-Command)
" Bundle "justinmk/vim-sneak"

" Ultisnips snippet plugin
" Bundle "SirVer/ultisnips"

" Open Documentation of word under cursor
" Bundle "Keithbsmiley/investigate.vim"

" Matchit.zip (% is configurable)
" Bundle "matchit.zip"

" Calendar.vim (Google Calendar + Tasks)
" Bundle "itchyny/calendar.vim"

" Ag.vim (153% replacement of the uses of ack)
" Bundle "rking/ag.vim"

" Easy-motion (fork of a better f-command )
" Bundle "haya14busa/vim-easymotion"

" Multiple cursors
" Bundle "terryma/vim-multiple-cursors"

" Bundle "bronson/vim-trailing-whitespace"
