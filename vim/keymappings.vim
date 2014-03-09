" Vim Keybindings {{{1
" --------------------------------------------------------

" Uppercase the current word in insert mode
nnoremap <C-u> <esc>vawUi

" Calculate with the expression-register
" inoremap <C-c> <C-r>=

" Use a more comfortable Leader Key (for a QUERTZ keyboard-layout)
let mapleader = " "

" Remap the CtrlP mapping to
let g:ctrlp_map = "<leader>p"
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Split vimrc to quick-edit the configs
nnoremap <leader>e :vsplit $MYVIMRC<CR>

" Mapping better splitting
nnoremap <silent> <C-e> :wincmd w<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

" Fixing the behaviour of <C-n> and <C-p>
cnoremap <C-p> <up>
cnoremap <C-n> <down>

" More comfortable way to change buffers
" nnoremap <silent> <leader>n :bn<enter>
" nnoremap <silent> <leader>N :bp<enter>

" Don't differ 'fake-lines'
nnoremap j gj
nnoremap k gk

" Use J,K to switch buffers + Join Lines with <C-J>
nnoremap <silent> J :bn<Enter>
nnoremap <silent> K :bp<Enter>
nnoremap <silent> <leader>j :join<Enter>

" Search for the same word but don't jump to it
nnoremap * *<C-O>

" Quickly toggle important settings
nnoremap <leader>c :ColorToggle<Enter>
nnoremap <silent> <leader>s :StripWhitespace<Enter>
nnoremap <silent> <leader>g :GitGutterToggle<Enter>

" Jump to the buffers directory
nnoremap <Leader>ü :cd %:p:h<cr>:pwd<cr>

" Faster open the current Folding
nnoremap <Space><Space> za

" 1}}}
" Autocommands {{{1
" --------------------------------------------------------

if has("autocmd")

    " Enable Spellcheck in *.md and *.txt files
    au BufNewFile,BufRead,BufEnter *.md     setlocal spell      spelllang=de_de
    au BufNewFile,BufRead,BufEnter *.txt    setlocal spell      spelllang=de_de

    " Disable Spellcheck in Help-Files
    au FileType help setlocal nospell

    " Enable marker-folding in Vim-files
    au FileType vim setlocal foldmethod=marker

    " Use pandoc to sort markdown (Use 'gq' in normal-mode)
    let pandoc_pipeline = "pandoc --from=markdown --to=markdown"
    au FileType markdown let &formatprg=pandoc_pipeline

endif

" 1}}}
" Abbreviations {{{1
" --------------------------------------------------------

iabbrev -> →
iabbrev Vergelich Vergleich
iabbrev vergelich vergleich

" 1}}}
" Not used key bindings {{{1
" -------------------------------------------------------------------

" Activate Spellcheck
" map <F2> :w!<CR>:aspell check %<CR>:e! %<CR>
" map <F2> :setlocal spell spelllang=de_de<CR>:set spell<CR>

" Easy Motion needs now only one press at <l-jeader>
" let g:EasyMotion_leader_key = '<Leader>'

" Use "," instead of ":" (save one keystroke)
" map , :

" Ultisnips stuff
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger= "<s-tab>"

" Remapping 0 to ^ to jump to the first character
" nnoremap 0 ^

" 1}}}
