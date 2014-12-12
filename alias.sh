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

# Start program with a customized config-file
# ---------------------------------------------

alias ncmpcpp="ncmpcpp -c $HOME/.config/ncmpcpp/config"
alias mpv="mpv --input-file=$HOME/.config/mpv/mpv-control"
alias irssi="sudo irssi --nick kokakolako --home /home/niklas/.config/irssi/"

# Shortcuts (+ sudo-shortcuts / abbreviations )
# ---------------------------------------------

alias e="emacs"
alias v="vim"

alias gti="git"
alias g="git"
alias hc="herbstclient"
alias G="grep --color=auto"
alias A="alsamixer"

alias shutdown="sudo shutdown"
alias reboot="sudo reboot"
alias poweroff="sudo poweroff"

# XBPS Shortcuts
# ---------------------------------------------

alias install="sudo xbps-install -Sy"
alias update="sudo xbps-install -Syu"
alias search="xbps-query -Rs"
alias remove="sudo xbps-remove -y"
alias clean="sudo xbps-remove -Oo"
alias upd="update && clean && update_git_submodules"

# Misc aliases
# ---------------------------------------------

alias tabbed="tabbed -d -c -t \#ffffff -T \#ff0055 -u \#ff0055 -U \#ffffff"
alias zathura="tabbed zathura -e $@ &> /dev/null"
alias emacs="emacsclient -nc &> /dev/null"
alias virt-env="source $HOME/projekte/python/virt-env/bin/activate && cd $HOME/projekte/python/virt-env"
alias locate="locate --regex"  # Using locate with regexes
alias info="info --vi-keys"    # Info with vi-keybindings
alias grep="grep --color=auto" # Colorize output of grep
alias cp="rsync -aP"           # Show a progress bar and do not ignore permissions
alias ipv4_addr="curl ipv4.icanhazip.com"
alias ipv6_addr="curl ipv6.icanhazip.com"
alias vim="vim -u $HOME/.config/vim/vimrc"
alias eclipse="eclipse -nosplash"
alias gimp="gimp --no-splash"
alias ffplay="ffplay -loglevel quiet"

function mcd () {
    mkdir -p "$@"
    cd "$@"
}

# If the current working directory contains less than 65 directories,
# show the directories of the current working directory via ls
# ---------------------------------------------

function chpwd () {
    [[ $( ls -l | wc -l ) -lt 65 ]] && ls
}

# Update git submodules
# ---------------------------------------------

function update_git_submodules () {
    local curr_dir=$PWD
    printf "\n\e[34m::\e[0;1m Aktualisieren der git submodules...\e[0m"
    submodules=("$HOME/.config/vim/")
    for submodule in $submodules; do
        cd "$submodule"
        git stash
        sudo git submodule foreach git pull origin master
        if [[ $submodule == "$HOME"/.config/vim/ ]]; then
            [[ -d "$HOME"/.config/vim/bundle ]] \
                && git add -A "$HOME"/.config/vim/bundle \
                && git commit -m "Updating vim submodules"
        fi
        git stash apply
    done
    cd "$curr_dir"
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
            $HOME )
                [[ $dir == "~" ]] \
                    && printf "\e[1m%s\t\e[3%sm%s\e[0m\n" "$stack_pos" "$color" "$dir" \
                    || printf "%s\t\e[3%sm%s\e[0m" "$stack_pos" "$color" "$dir"
            ;;
            $dir )
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

function irssi-add () {
    if [[ ! -f /home/niklas/.config/irssi/scripts/available/"$@".pl ]]; then
        wget  \
            -P "$HOME"/.config/irssi/scripts/available/ \
            https://github.com/irssi/scripts.irssi.org/blob/gh-pages/scripts/"$@".pl \
            &> /dev/null
    fi
}

