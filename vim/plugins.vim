" Vundle Settings
" --------------------------------------------------------

filetype off                  " required!

set rtp+=~/.config/vim/bundle/vundle/
call vundle#rc("~/.config/vim/bundle")

" let Vundle manage Vundle
Bundle "gmarik/vundle"

" Colorsheme
" --------------------------------------------------------

Bundle "kokakolako/molokai"
set background=dark     " Set a dark background
colorscheme molokai   " Set a colorsheme
" Bundle "altercation/vim-colors-solarized"
" Bundle "tomasr/molokai"

" Airline (lightweight powerline alternative)
" --------------------------------------------------------

Bundle "bling/vim-airline"
Bundle "paranoida/vim-airlineish"

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#checks = [ "indent", "trailing" ]
let g:airline#extensions#whitespace#show_message = 1
let g:airline_theme = "airlineish"

" Neocomplete
" --------------------------------------------------------

Bundle "Shougo/neocomplete"


let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" Misc Plugins
" --------------------------------------------------------

Bundle "ntpeters/vim-better-whitespace" " Highlight trailing whitespace
Bundle "Townk/vim-autoclose" " Close tags automagically
Bundle "kien/ctrlp.vim" " Open buffer more comfortable
Bundle "rstacruz/sparkup" " Something like Emmet for vim
Bundle "scrooloose/syntastic" " Syntastic + Linter
Bundle "godlygeek/tabular" " Sorting config-parameters
Bundle "suxpert/vimcaps" " Disable caps-lock
Bundle "matchit.zip" " Matchit.zip (% is configurable)
Bundle "justinmk/vim-sneak" " Better 'f'-Command
Bundle 'LaTeX-Box-Team/LaTeX-Box' "LaTeX Plugin
Bundle "tommcdo/vim-exchange" " Swap two regions with 'cx'
Bundle "lilydjwg/colorizer" " Colorize Hex Codes

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


" Use neonippet for snippet management
Bundle "Shougo/neosnippet"
Bundle "Shougo/neosnippet-snippets"

