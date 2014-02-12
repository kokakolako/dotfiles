" Vim Keybindings
" --------------------------------------------------------

" Uppercase the current word in insert mode
inoremap <c-u> <esc>vawUi

" Calculate with the expression-register
" inoremap <C-c> <C-r>=

" Use a more comfortable Leader Key (for a QUERTZ keyboard-layout)
let mapleader = ","

" Remap the CtrlP mapping to
let g:ctrlp_map = "<leader>p"
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Split vimrc to quick-edit the configs
nnoremap <leader>e :vsplit $MYVIMRC<cr>

" Reload vimrc-file when <F5> is pressed
nnoremap <f5> :source $HOME/.config/vim/vimrc<enter>

" Mapping better splitting
nnoremap <C-w>e <C-w>w

" Fixing the behaviour of <C-n> and <C-p>
cnoremap <C-p> <up>
cnoremap <C-n> <down>

" More comfortable way to change buffers
nnoremap <silent> <leader>n :bn<enter>
nnoremap <silent> <leader>N :bp<enter>

" Don't differ 'fake-lines'
nnoremap j gj
nnoremap k gk


" Abbreviations
" --------------------------------------------------------

iabbrev -> →
iabbrev Vergelich Vergleich
iabbrev vergelich vergleich


" Not used key bindings
" -------------------------------------------------------------------

" Activate Spellcheck
" map <F2> :w!<CR>:aspell check %<CR>:e! %<CR>
" map <F2> :setlocal spell spelllang=de_de<CR>:set spell<CR>

" Easy Motion needs now only one press at <leader>
" let g:EasyMotion_leader_key = '<Leader>'

" Use "," instead of ":" (save one keystroke)
" map , :

" Ultisnips stuff
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger= "<s-tab>"

" Remapping 0 to ^ to jump to the first character
" nnoremap 0 ^

