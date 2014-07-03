# Colorize output
# ---------------------------------------------

alias grep="grep --color=auto"
alias cp="rsync -aP"

# Show the directory-stack as stack
# ---------------------------------------------

alias dirs="dirs -v"
alias pushd="pushd; dirs -v"
alias popd="popd; dirs -v"

# Editing config files
# ---------------------------------------------

alias iconfig="vim $HOME/.config/i3/config +'lcd $HOME/.config/i3'"
alias vconfig="vim $HOME/.config/vim/vimrc $HOME/.config/vim/extend.vim $HOME/.config/vim/plugins.vim +'lcd $HOME/.config/vim'"
alias zconfig="vim $HOME/.config/zsh/zshrc $HOME/.config/zsh/alias.sh +'lcd $HOME/.config/zsh'"
alias uconfig="vim $HOME/.config/X11/Xresources +'lcd $HOME/.config/X11'"
alias nconfig="vim $HOME/.config/ncmpcpp/config +'lcd $HOME/.config/ncmpcpp'"
alias sconfig="vim $HOME/.config/sxhkd/sxhkdrc +'lcd $HOME/.config/sxhkd'"
alias hconfig="vim $HOME/.config/herbstluftwm/autostart $HOME/.config/herbstluftwm/panel.sh +'lcd $HOME/.config/herbstluftwm'"

# Start program with a customized config-file
# ---------------------------------------------

alias ncmpcpp="ncmpcpp --config $HOME/.config/ncmpcpp/config"
alias pandoc="pandoc --latex-engine=xelatex"
alias mpv="mpv -input file=$HOME/.config/mpv/mpv-control"

# Git aliases
# ---------------------------------------------

alias gti="git"
alias g="git"

# Shortcuts (+ sudo-shortcuts)
# ---------------------------------------------

alias v="vim"
alias gr="grep --color=auto "
alias ge="grep -E --color=auto"
alias hc="herbstclient"
alias sctl="sudo systemctl"
alias shutdown="sudo shutdown"

# Remove all orphans
# ---------------------------------------------

remove_orphans () {
    echo -e "\e[34m::\e[0;1m Entferne nicht-benötigte Pakete...\e[0m"
    pacman -Qdt
    if [[ $? == 0 ]]; then
        sudo pacman -Rns $( pacman -Qdt )
        echo " Es wurden alle nicht-benötigte Pakete entfernt"
    else
        echo " Es gibt nichts zu tun"
    fi
}

# Update git submodules
# ---------------------------------------------

update_git_submodules () {
    local curr_dir=$PWD
    echo -e "\e[34m::\e[0;1m Aktualisieren der git submodules...\e[0m"
    submodules=("$HOME/.config/vim/")
    for submodule in $submodules; do
        cd "$submodule"
        sudo git submodule foreach git pull origin master
    done
    cd "$curr_dir"
}

# Update the complete system
# ---------------------------------------------

upd () {
    pacaur -Syu
    pacaur -Sc
    remove_orphans
    update_git_submodules
}

# Colorizing Man-Pages
# ---------------------------------------------

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# Update my own, local packages

update_my_own_pkgs() {
    for i in "$( find -type d $HOME/.abs )"; do
        cd $i
    done
}

# Misc aliases
# ---------------------------------------------

alias virt-env="source $HOME/projekte/python/virt-env/bin/activate && cd $HOME/projekte/python/virt-env"
alias rlocate="locate --regex"
alias uzbl="uzbl-tabbed"
alias info="info --vi-keys"
