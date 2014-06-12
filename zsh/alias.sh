# Aliases
# ---------------------------------------------

## Colorize grep
alias grep="grep --color=auto"
alias cp="rsync -aP"

## Show the Directory Stack as Stack
alias dirs="dirs -v"
alias pushd="pushd; dirs -v"
alias popd="popd; dirs -v"

## Vim aliases
alias vim="vim -u $HOME/.config/vim/vimrc"
alias vimkeys="vim $HOME/.config/vim/keymappings.vim"
alias vundle="vim $HOME/.config/vim/plugins.vim"
alias vimtipps="vim $HOME/.config/vim/vimtipps"

## Editing config files
alias iconfig="vim $HOME/.config/i3/config +'lcd $HOME/.config/i3'"
alias vconfig="vim $HOME/.config/vim/vimrc +'lcd $HOME/.config/vim'"
alias zconfig="vim $HOME/.config/zsh/zshrc +'lcd $HOME/.config/zsh'"
alias xconfig="vim $HOME/.config/X11/Xresources +'lcd $HOME/.config/X11'"
alias nconfig="vim $HOME/.config/ncmpcpp/config +'lcd $HOME/.config/ncmpcpp'"
alias sconfig="vim $HOME/.config/sxhkd/sxhkdrc +'lcd $HOME/.config/sxhkd/'"

## Sudo aliases
alias sctl="sudo systemctl"
alias shutdown="sudo shutdown"

## Start program with a customized config-file
alias ncmpcpp="ncmpcpp --config $HOME/.config/ncmpcpp/config"
alias nginx="nginx -c $HOME/.config/nginx/config"
alias pandoc="pandoc --latex-engine=xelatex"
alias tmux="tmux -f $HOME/.config/tmux/tmux.conf"
alias msmtp="msmtp -C $HOME/.config/msmtp/msmtprc"

alias mpv="mpv -input file=$HOME/.config/mpv/mpv-control"

## Misc aliases
alias virt-env="source $HOME/projekte/python/virt-env/bin/activate && cd $HOME/projekte/python/virt-env"
alias rlocate="locate --regex"
alias uzbl="uzbl-tabbed"

## Git Aliases
alias gti="git"
alias gstatus="git status"
alias gpush="git push origin master"
alias greset="git reset"
alias ginit="git init"
alias gclone="git clone"
alias gcommit="git commit"
alias gdiff="git diff"
alias gadd="git add"
alias glog="git lg"
alias grm="git rm"
alias gcheckout="git checkout"
alias gbranch="git branch"

## Shortcuts
alias v="vim"
alias g="grep"
alias ge="grep -E"

