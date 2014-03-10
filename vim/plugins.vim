" Vundle Settings {{{1
" --------------------------------------------------------

filetype off                  " required!

set rtp+=~/.config/vim/bundle/vundle/
call vundle#rc("$HOME/.config/vim/bundle")

" let Vundle manage Vundle
Bundle "gmarik/vundle"
" 1}}}
" Colorsheme {{{1
" --------------------------------------------------------

" Enable the colorsheme
Bundle "kokakolako/molokai"
colorscheme molokai   " Set a colorsheme

" Set a dark background
set background=dark     " Set a dark background

" 1}}}
" Airline (lightweight powerline alternative) {{{1
" --------------------------------------------------------

Bundle "bling/vim-airline"
Bundle "paranoida/vim-airlineish"

" Use powerline fonts
let g:airline_powerline_fonts = 1

" Use a nice airline theme
let g:airline_theme = "airlineish"

" Enable some extensions
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1

" Configure the whitespace extension
let g:airline#extensions#whitespace#checks = [ "indent", "trailing" ]
let g:airline#extensions#whitespace#show_message = 1

" Theming the seperators ( airline + tabline )
let g:airline_left_sep = " "
let g:airline_right_sep = " "
let g:airline_left_alt_sep = "|"
let g:airline_right_alt_sep = "|"
let g:airline#extensions#tabline#left_sep = " "
let g:airline#extensions#tabline#right_sep = "  "
let g:airline#extensions#tabline#right_alt_sep = "|"
let g:airline#extensions#tabline#left_alt_sep = "|"
"1 }}}
" Neocomplete (Autocompletion in vim) {{{1
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
" 1}}}
" Textobj-user (Create custom textobjects) {{{1
" --------------------------------------------------------

" Create custom text-objects
Bundle "kana/vim-textobj-user"

" textobj-entire - Text objects for entire buffer
" Version: 0.0.3
" Copyright (C) 2009-2014 Kana Natsuno <http://whileimautomaton.net/>
" License: MIT license {{{2
" Permission is hereby granted, free of charge, to any person obtaining
" a copy of this software and associated documentation files (the
" "Software"), to deal in the Software without restriction, including
" without limitation the rights to use, copy, modify, merge, publish,
" distribute, sublicense, and/or sell copies of the Software, and to
" permit persons to whom the Software is furnished to do so, subject to
" the following conditions:
"
" The above copyright notice and this permission notice shall be included
" in all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
" OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
" MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
" IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
" CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
" TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
" SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" 2}}}

if exists('g:loaded_textobj_entire')
    finish
endif

call textobj#user#plugin('entire', {
    \ '-': {
        \ '*sfile*': expand('<sfile>:p'),
        \ 'select-a': 'ae', '*select-a-function*': 's:select_a',
        \ 'select-i': 'ie', '*select-i-function*': 's:select_i'
    \ }
\ })

function! s:select_a()
    " To easily back to the last position after a command.
    " For example: yae<C-o>
    mark '
    keepjumps normal! gg0
    let start_pos = getpos('.')
    keepjumps normal! G$
    let end_pos = getpos('.')
    return ['V', start_pos, end_pos]
endfunction

function! s:select_i()
    " To easily back to the last position after a command.
    " For example: yie<C-o>
    mark '
    keepjumps normal! gg0
    call search('^.', 'cW')
    let start_pos = getpos('.')
    keepjumps normal! G$
    call search('^.', 'bcW')
    normal! $
    let end_pos = getpos('.')
    return ['V', start_pos, end_pos]
endfunction

let g:loaded_textobj_entire = 1
" 1}}}
" Misc Plugins {{{1
" --------------------------------------------------------
" Highlight trailing whitespace {{{2
Bundle "ntpeters/vim-better-whitespace"
" 2}}}
" Close tags automagically {{{2
Bundle "kana/vim-smartinput"
" 2}}}
" Open buffer more comfortable {{{2
Bundle "kien/ctrlp.vim"
" 2}}}
" Something like Emmet for vim {{{2
Bundle "rstacruz/sparkup"
" 2}}}
" Syntastic + Linter {{{2
Bundle "scrooloose/syntastic"
" 2}}}
" Sorting config-parameters {{{2
Bundle "godlygeek/tabular"
" 2}}}
" Disable caps-lock {{{2
Bundle "suxpert/vimcaps"
" 2}}}
" Matchit.zip (% is configurable) {{{2
Bundle "matchit.zip"
" 2}}}
" Better 'f'-Command {{{2
Bundle "justinmk/vim-sneak"
" 2}}}
"LaTeX Plugin {{{2
Bundle "LaTeX-Box-Team/LaTeX-Box"
" 2}}}
" Swap two regions with 'cx' {{{2
Bundle "tommcdo/vim-exchange"
" 2}}}
" Intelligent Folding of Markdown {{{2
Bundle "nelstrom/vim-markdown-folding"
" 2}}}
" Colorize Hex Codes {{{2
Bundle "lilydjwg/colorizer"
" 2}}}
" Great plugins from Tim Pope "{{{2
Bundle "tpope/vim-abolish"
Bundle "tpope/vim-commentary"
Bundle "tpope/vim-eunuch"
Bundle "tpope/vim-fugitive"
Bundle "tpope/vim-obsession"
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-vinegar"
" 2}}}
" Syntax-Highlighting {{{2
Bundle "tpope/vim-markdown"
Bundle "Matt-Stevens/vim-systemd-syntax"
" 2}}}
" Use neonippet for snippet management {{{2
Bundle "Shougo/neosnippet"
Bundle "Shougo/neosnippet-snippets"
"2}}}
" Highlight the changed lines (git diff) {{{2
Bundle "airblade/vim-gitgutter"
" 2}}}
" Automatic select textobjects {{{2
Bundle "gcmt/wildfire.vim"
" 2}}}
" 1}}}
