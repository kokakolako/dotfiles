#!/usr/bin/ruby

plugins = [
    "https://github.com/kokakolako/molokai",
    "https://github.com/bling/vim-airline",
    "https://github.com/paranoida/vim-airlineish",
    "https://github.com/Shougo/neocomplete",
    "https://github.com/kana/vim-textobj-user",
    "https://github.com/ntpeters/vim-better-whitespace",
    "https://github.com/kana/vim-smartinput",
    "https://github.com/kien/ctrlp.vim",
    "https://github.com/rstacruz/sparkup",
    "https://github.com/scrooloose/syntastic",
    "https://github.com/godlygeek/tabular",
    "https://github.com/suxpert/vimcaps",
    "https://github.com/matchit.zip",
    "https://github.com/justinmk/vim-sneak",
    "https://github.com/LaTeX-Box-Team/LaTeX-Box",
    "https://github.com/tommcdo/vim-exchange",
    "https://github.com/nelstrom/vim-markdown-folding",
    "https://github.com/lilydjwg/colorizer",
    "https://github.com/tpope/vim-abolish",
    "https://github.com/tpope/vim-commentary",
    "https://github.com/tpope/vim-eunuch",
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/tpope/vim-obsession",
    "https://github.com/tpope/vim-repeat",
    "https://github.com/tpope/vim-surround",
    "https://github.com/tpope/vim-vinegar",
    "https://github.com/tpope/vim-markdown",
    "https://github.com/Matt-Stevens/vim-systemd-syntax",
    "https://github.com/Shougo/neosnippet",
    "https://github.com/Shougo/neosnippet-snippets",
    "https://github.com/airblade/vim-gitgutter",
    "https://github.com/gcmt/wildfire.vim",
    "https://github.com/tpope/vim-pathogen",
]

plugins.each { | i |
    if ( "#{i}" == "" ) {
        `git submodule add '#{i}' > /dev/null`
    }
}
