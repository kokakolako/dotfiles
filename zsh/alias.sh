# Editing config files
# ---------------------------------------------

alias iconfig="vim $HOME/.config/i3/config +'lcd $HOME/.config/i3'"
alias vconfig="vim $HOME/.config/vim/vimrc $HOME/.config/vim/extend.vim $HOME/.config/vim/plugins.vim +'lcd $HOME/.config/vim'"
alias zconfig="vim $HOME/.config/zsh/zshrc $HOME/.config/zsh/alias.sh +'lcd $HOME/.config/zsh'"
alias uconfig="vim $HOME/.config/X11/Xresources +'lcd $HOME/.config/X11'"
alias nconfig="vim $HOME/.config/ncmpcpp/config +'lcd $HOME/.config/ncmpcpp'"
alias sconfig="vim $HOME/.config/sxhkd/sxhkdrc +'lcd $HOME/.config/sxhkd'"
alias hconfig="vim $HOME/.config/herbstluftwm/autostart $HOME/.config/herbstluftwm/panel.sh +'lcd $HOME/.config/herbstluftwm'"
alias tconfig="vim $HOME/.config/tmux/tmux.conf +'lcd $HOME/.config/tmux'"
alias rconfig="sudo vim /etc/minirc.conf /sbin/rc"

# Start program with a customized config-file
# ---------------------------------------------

alias ncmpcpp="ncmpcpp -c $HOME/.config/ncmpcpp/config"
alias pandoc="pandoc --latex-engine=xelatex"
alias mpv="mpv -input file=$HOME/.config/mpv/mpv-control"

# Shortcuts (+ sudo-shortcuts)
# ---------------------------------------------

alias gti="git"
alias g="git"
alias v="vim"
alias gr="grep --color=auto "
alias ge="grep -E --color=auto"
alias hc="herbstclient"
alias sctl="sudo systemctl"
alias shutdown="sudo shutdown"
alias reboot="sudo reboot"
alias poweroff="sudo poweroff"

# Misc aliases
# ---------------------------------------------

alias virt-env="source $HOME/projekte/python/virt-env/bin/activate && cd $HOME/projekte/python/virt-env"
alias locate="locate --regex"  # Using locate with regexes
alias uzbl="uzbl-tabbed"       # Starting uzbl as uzbl-tabbed
alias info="info --vi-keys"    # Info with vi-keybindings
alias grep="grep --color=auto" # Colorize output of grep
alias cp="rsync -aP"           # Show a progress bar and do not ignore permissions

# Remove all orphans
# ---------------------------------------------

remove_orphans () {
    echo "\e[34m::\e[0;1m Entferne nicht-benötigte Pakete...\e[0m"
    pacman -Qdt
    if [[ $? == 0 ]]; then
        local orphans=$( pacaur -Qdt | wc -l )
        if [[ $orphans == 1 ]]; then
            sudo pacman -Rns $( pacaur -Qdt | sed -E 's/\s(([0-9]*[\.\-])*)[0-9]*//g' )
        elif [[ $orphans > 1 ]]; then
            sudo pacman -Rns $( pacaur -Qdt | sed -E 's/\s(([0-9]*[\.\-])*)[0-9]*//g' | tr "\n" " " )
        fi
        [[ $? == 0 ]] && echo " Es wurden alle nicht-benötigte Pakete entfernt"
    else
        echo " Es gibt nichts zu tun"
    fi
}

# Update git submodules
# ---------------------------------------------

update_git_submodules () {
    local curr_dir=$PWD
    echo "\e[34m::\e[0;1m Aktualisieren der git submodules...\e[0m"
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

man () {
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
# ---------------------------------------------

update_my_own_pkgs () {
    for i in "$( find -type d $HOME/.abs )"; do
        cd $i
    done
}

# Reload tmux
# ---------------------------------------------

tmux-reload () {
    tmux source-file $HOME/.config/tmux/tmux.conf > /dev/null
    [ $? -eq 0 ] \
        && echo "Sucessfully reloaded the tmux.conf file" \
        || echo "An error occured while trying to reload the tmux.conf file"
}

# Reload sxhkd
# ---------------------------------------------

sxhkd-reload () {
    kill -s USR1 "$( pidof sxhkd )" > /dev/null
    [ $? -eq 0 ] \
        && echo "Sucessfully reloaded the sxhkdrc file" \
        || echo "An error occured while trying to reload the sxhkdrc file"
}

# Colorized "dirs -v"
# ---------------------------------------------

stack () {
    lines=$( dirs -v | wc -l )
    lines=$(( $lines - 1 ))
    for i in $( seq 0 $lines ); do
        local stack_pos="$i"
        local color=
        ## Do not remove the "-w" parameter of grep, beacause with "-w", grep
        ## is only searching the first matching
        local dir=$( dirs -v | grep -w "$stack_pos" | cut -c 3- )
        ## Check if $i is lesser or equal to 5, to use them as a color-code
        if [[ $i -le 5 ]]; then
            color=$(( $i + 1 ))
        elif [[ $i -gt 5 ]]; then
            ## With modulus 6 its possible to get results inside the range
            ## 0-5, totally irrellevant how high the original number is
            color=$(( $i % 6 ))
            ## Now add 1 to the calculated number because the color-code of 0
            ## is totally boring
            color=$(( $color + 1 ))
        fi
        echo "${stack_pos}: \e[3${color}m${dir}\e[0m"
    done
}

alias popd="popd; stack"
alias dirs="dirs -v"

