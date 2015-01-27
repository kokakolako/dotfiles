# Defaults
# ---------------------------------------------


# Path to your oh-my-fish.
set fish_path $HOME/.config/fish/oh-my-fish

# Enable oh-my-fish plugins
set fish_plugins autojump vi-mode

## Enable Vi-Mode
set vi_mode_default vi_mode_insert
function vi_mode_user_key_bindings
    bind \el  suppress-autosuggestion
end

# Theme
set fish_theme kokakolako

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
# set fish_plugins autojump vi-mode

## Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

## Disable stupid welcome message
set -g -x fish_greeting

# Aliases
# ---------------------------------------------

## Colorize grep
alias grep "grep --color auto"

## Show the Directory Stack as Stack
alias dirs "dirs -v"
alias pushd "pushd; dirs -v"
alias popd "popd; dirs -v"

## Vim aliases
alias vim "vim -u $HOME/.config/vim/vimrc"
alias vi "vim -u $HOME/.config/vim/vimrc"
alias vimkeys "vim $HOME/.config/vim/keymappings.vim"
alias vundle "vim $HOME/.config/vim/plugins.vim"
alias vimtipps "vim $HOME/.config/vim/vimtipps"
# alias wim "vim -u $HOME/.config/vim/wimrc"
# alias vi "gvim -v -u $HOME/.config/vim/vimrc"
# alias vim "gvim -v -u $HOME/.config/vim/vimrc"

## Editing config files
alias iconfig "vim $HOME/.config/i3/config +'lcd $HOME/.config/vim/'"
alias vconfig "vim $HOME/.config/vim/vimrc +'lcd $HOME/.config/vim/'"
alias zconfig "vim $HOME/.config/zsh/zshrc +'lcd $HOME/.config/zsh/'"
alias uconfig "vim $HOME/.config/X11/Xresources +'lcd $HOME/.config/'"
alias fconfig "vim $HOME/.config/fish/config.fish +'lcd $HOME/.config/fish'"

## Sudo aliases
alias sctl "sudo systemctl"
alias shutdown "sudo shutdown"

## Start program with a customized config-file
alias ncmpcpp "ncmpcpp --config $HOME/.config/ncmpcpp/config"
alias nginx "nginx -c $HOME/.config/nginx/config"
alias pandoc "pandoc --latex-engine xelatex"
alias tmux "tmux -f $HOME/.config/tmux/tmux.conf"
alias msmtp "msmtp -C $HOME/.config/msmtp/msmtprc"

## Misc aliases
alias monitor.sh "$HOME/.bin/monitor.sh"
alias rlocate "locate --regex"
alias uzbl "uzbl-tabbed"
# alias urxvt "urxvt -e bash -c 'tmux -q has-session && exec tmux attach-session -d || exec tmux new-session -n$USER -s$USER@$HOSTNAME'"

## Git Aliases
alias gstat "git status"
alias gpush "git push origin master"
alias greset "git reset"
alias ginit "git init"
alias gclone "git clone"

## Abbreviations
alias gti "git"
alias sl "ls"
