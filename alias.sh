# Editing config files
# ---------------------------------------------

alias iconfig="vim $HOME/.config/i3/config +'lcd $HOME/.config/i3'"
alias vconfig="vim $HOME/.config/vim/vimrc $HOME/.config/vim/extend.vim $HOME/.config/vim/plugins.vim +'lcd $HOME/.config/vim'"
alias zconfig="vim $HOME/.config/zsh/zshrc $HOME/.config/alias.sh +'lcd $HOME/.config/zsh'"
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
alias e="emacs"


# Misc aliases
# ---------------------------------------------

alias emacs="emacsclient -nc &> /dev/null"
alias virt-env="source $HOME/projekte/python/virt-env/bin/activate && cd $HOME/projekte/python/virt-env"
alias locate="locate --regex"  # Using locate with regexes
alias uzbl="uzbl-tabbed"       # Starting uzbl as uzbl-tabbed
alias info="info --vi-keys"    # Info with vi-keybindings
alias grep="grep --color=auto" # Colorize output of grep
alias cp="rsync -aP"           # Show a progress bar and do not ignore permissions
alias ipv4_addr="curl ipv4.icanhazip.com"
alias ipv6_addr="curl ipv6.icanhazip.com"

function xcmenuctrl () {
    clipboard_entry="$( xcmenu --dmenu | dmenu -l 11 -i -nb '#101010' -sb '#FF0055' -nf '#FFFFFF' -sf '#101010' -fn 'Inconsolata for Powerline-14' )"
    ## Remove the pattern "*: " from the beginning of $clipboard_entry
    printf "${clipboard_entry#*: }"
}


# Hook which is invoked when the current working directory is changing
# ---------------------------------------------

function chpwd () {
    ## If the current working directory contains lesser than 30 directories,
    ## show the directories of the current working directory via ls
    [[ $( ls -l | wc -l ) -lt 65 ]] && ls
}


# Remove all orphans
# ---------------------------------------------

remove_orphans () {
    printf "\e[34m::\e[0;1m Entferne nicht-benötigte Pakete...\e[0m\n"
    pacaur -Qdt # List all orphans
    if [[ $? == 0 ]]; then
        local orphans=$( pacaur -Qdt | wc -l )
        [[ $orphans -ge 1 ]] \
            && sudo pacaur -Rns $( pacaur -Qdtq )
        [[ $? == 0 ]] \
            && printf " Es wurden alle nicht-benötigte Pakete entfernt" \
            || printf " Beim Entfernen der nicht-benötigten Pakete kam es zu einem Fehler"
    else
        printf " Es gibt nichts zu tun"
    fi
}


# Update git submodules
# ---------------------------------------------

function update_git_submodules () {
    local curr_dir=$PWD
    printf "\n\e[34m::\e[0;1m Aktualisieren der git submodules...\e[0m"
    submodules=("$HOME/.config/vim/")
    for submodule in $submodules; do
        cd "$submodule"
        sudo git submodule foreach git pull origin master
    done
    cd "$curr_dir"
}


# Update the complete system
# ---------------------------------------------

function upd () {
    pacaur -Syu             ## Update all packages
    pacaur -Sc              ## Clear the cache
    remove_orphans          ## Remove all orphans
    update_git_submodules   ## Update all submodules
}


# Colorizing Man-Pages
# ---------------------------------------------

function man () {
    env LESS_TERMCAP_mb=$'\e[36m'   \
    LESS_TERMCAP_md=$'\e[36m'       \
    LESS_TERMCAP_me=$'\e[0m'        \
    LESS_TERMCAP_se=$'\e[0m'        \
    LESS_TERMCAP_so=$'\e[1m'        \
    LESS_TERMCAP_ue=$'\e[0m'        \
    LESS_TERMCAP_us=$'\e[31m'       \
    man "$@"
}


# Update my own, local packages
# ---------------------------------------------

function update_my_own_pkgs () {
    for i in "$( find -type d $HOME/.abs )"; do
        cd $i
    done
}


# Reload tmux
# ---------------------------------------------

function tmux-reload () {
    tmux source-file $HOME/.config/tmux/tmux.conf > /dev/null
    [ $? -eq 0 ] \
        && printf "Sucessfully reloaded the tmux.conf file\n" \
        || printf "An error occured while trying to reload the tmux.conf file\n"
}


# Reload sxhkd
# ---------------------------------------------

function sxhkd-reload () {
    kill -s USR1 "$( pidof sxhkd )" > /dev/null
    [ $? -eq 0 ] \
        && printf "Sucessfully reloaded the sxhkdrc file" \
        || printf "An error occured while trying to reload the sxhkdrc file"
}


# Colorized "dirs", "pushd", "popd"
# ---------------------------------------------

function dirs () {
    ## To use the builtin dirs command the command must be invoked via "builtin"
    local lines=$( builtin dirs -v | wc -l )
    local lines=$(( $lines - 1 ))
    for i in $( seq 0 $lines ); do
        local args="$@"
        local stack_pos="$i"
        local color=
        ## Do not remove the "-w" parameter of grep, because with "-w" grep
        ## is only searching the first matching
        local dir=$( builtin dirs -v | grep -w "$stack_pos" | cut -c 3- )
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
        ## When "pushd" is invoked, the pushed directory should be hightlighted
        case $args in
            "$HOME" )
                [[ "$dir" == "~" ]] \
                    && printf "\e[1m%s\t\e[3%sm%s\e[0m\n" "$stack_pos" "$color" "$dir" \
                    || printf "%s\t\e[3%sm%s\e[0m" "$stack_pos" "$color" "$dir"
            ;;
            "$dir" )
                printf "\e[1m%s\t\e[3%sm%s\e[0m\n" "$stack_pos" "$color" "$dir"
            ;;
            * )
                printf "%s\t\e[3%sm%s\e[0m\n" "$stack_pos" "$color" "$dir"
            ;;
        esac
    done
}

function pushd () {
    local args="$@"
    builtin pushd "$args" > /dev/null
    dirs "$args"
}

alias popd="popd "$@" > /dev/null; dirs"
