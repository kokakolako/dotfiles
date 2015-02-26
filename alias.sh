# editing config files
# ---------------------------------------------
alias hconfig="vim $HOME/.config/herbstluftwm/autostart $HOME/.config/herbstluftwm/panel +'lcd $HOME/.config/herbstluftwm'"
alias iconfig="vim $HOME/.config/i3/config +'lcd $HOME/.config/i3'"
alias nconfig="vim $HOME/.config/ncmpcpp/config +'lcd $HOME/.config/ncmpcpp'"
alias sconfig="vim $HOME/.config/sxhkd/sxhkdrc +'lcd $HOME/.config/sxhkd'"
alias tconfig="vim $HOME/.config/tmux/tmux.conf +'lcd $HOME/.config/tmux'"
alias uconfig="vim $HOME/.config/X11/Xresources +'lcd $HOME/.config/X11'"
alias vconfig="vim $HOME/.config/vim/vimrc $HOME/.config/vim/extend.vim $HOME/.config/vim/plugins.vim +'lcd $HOME/.config/vim'"
alias zconfig="vim $HOME/.config/zsh/zshrc $HOME/.config/alias.sh +'lcd $HOME/.config/zsh'"

# start program with a customized config-file
# ---------------------------------------------
alias abcde="abcde -c $HOME/.config/abcde/abcde.conf"
alias eclipse="eclipse -nosplash"
alias emacs="emacsclient -nc &> /dev/null"
alias emerge="emerge --quiet-build=y"
alias ffplay="ffplay -loglevel quiet"
alias gimp="gimp --no-splash"
alias grep="grep --color=auto"
alias info="info --vi-keys"
alias ipv4_addr="curl ipv4.icanhazip.com"
alias ipv6_addr="curl ipv6.icanhazip.com"
alias irssi="sudo irssi --nick kokakolako --home /home/niklas/.config/irssi/"
alias locate="locate --regex"
alias minecraft="DRI_PRIME=1 java -jar "$HOME"/.opt/Minecraft.jar"
alias mpv="DRI_PRIME=1 mpv --input-file=$HOME/.config/mpv/mpv-control"
alias ncmpcpp="ncmpcpp -c $HOME/.config/ncmpcpp/config"
alias newsbeuter="newsbeuter -u ~/.config/newsbeuter/urls -C ~/.config/newsbeuter/config -r 2> /dev/null"
alias open_with_amd="DRI_PRIME=1 $@"
alias redshift="redshift -l 51.43072:7.16941 &> /dev/null &"
alias tabbed="tabbed -d -c -t \#ffffff -T \#ff0055 -u \#ff0055 -U \#ffffff"
alias vim="vim -u $HOME/.config/vim/vimrc"
alias zathura="tabbed -t '#ffffff' -T '#ff0055' -u '#ff0055' -U '#ffffff' -e zathura"

# git aliases
# ---------------------------------------------
alias add="git add"
alias branch="git branch"
alias checkout="git checkout"
alias commit="git commit"
alias merge="git merge"
alias pull="git pull"
alias push="git push"
alias status="git status"
alias annex="git annex"

# shortcuts
# ---------------------------------------------
alias A="alsamixer"
alias E="emacs"
alias V="vim"
alias G="git"
alias H="herbstclient"

# sudo-shortcuts
# ---------------------------------------------
alias blkid="sudo blkid"
alias emerge="sudo emerge"
alias poweroff="sudo poweroff"
alias reboot="sudo reboot"
alias shutdown="sudo shutdown"

# make directory and cd into it
# ---------------------------------------------
function mcd () {
    mkdir -p "$@"
    cd "$@"
}

# if the current working directory contains less than 65 directories,
# show the directories of the current working directory via ls
# ---------------------------------------------
function chpwd () {
    [[ $( ls -l | wc -l ) -lt 65 ]] && ls
}

# update git submodules
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

# colorizing man-pages
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

# reload tmux
# ---------------------------------------------
function tmux_reload () {
    tmux source-file $HOME/.config/tmux/tmux.conf > /dev/null
    [ $? -eq 0 ] \
        && printf "Sucessfully reloaded the tmux.conf file\n" \
        || printf "An error occured while trying to reload the tmux.conf file\n"
}


# reload sxhkd
# ---------------------------------------------
function sxhkd_reload () {
    kill -s USR1 "$( pidof sxhkd )" > /dev/null
    [ $? -eq 0 ] \
        && printf "Sucessfully reloaded the sxhkdrc file" \
        || printf "An error occured while trying to reload the sxhkdrc file"
}


# colorized "dirs", "pushd", "popd"
# ---------------------------------------------
function dirs () {
    ## to use the builtin dirs command the command must be invoked via "builtin"
    local lines=$( builtin dirs -v | wc -l )
    local lines=$(( $lines - 1 ))
    local color=
    for stack_pos in $( seq 0 $lines ); do
        ## do not remove the "-w" parameter of grep, because with "-w" grep
        ## is only searching the first matching
        local dir=$( builtin dirs -v | grep -w "$stack_pos" | cut -c 3- )
        ## check if $i is lesser or equal to 5, to use them as a color-code
        if [[ $i -le 5 ]]; then
            color=$(( $i + 1 ))
        elif [[ $i -gt 5 ]]; then
            ## with modulus 6 its possible to get results inside the range
            ## 0-5, totally irrellevant how high the original number is
            color=$(( $i % 6 ))
            ## now add 1 to the calculated number because the color-code of 0
            ## is totally boring
            color=$(( $color + 1 ))
        fi
        ## when "pushd" is invoked, the pushed directory should be hightlighted
        case $@ in
            $HOME )
                [[ $dir == "~" ]] \
                    && printf "\e[1m%s\t\e[3%sm%s\e[0m\n" "$stack_pos" "$color" "$dir" \
                    || printf "%s\t\e[3%sm%s\e[0m\n" "$stack_pos" "$color" "$dir"
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
    builtin pushd "$@" > /dev/null
    dirs "$@"
}

alias popd="popd "$@" > /dev/null; dirs"

# sxiv: move marked files
# ---------------------------------------------
function sxiv_mv () {
    local picture=$1
    local dest_dir=$2
    for file in $( sxiv -o $picture ); do
        mv "$file" "$dest_dir/$file"
    done
}

# sxiv: remove marked files
# ---------------------------------------------
function sxiv_rm () {
    local picture=$1
    sxiv -o "$picture" | xargs rm
}

# irssi: add a script to irssi
# ---------------------------------------------
function irssi_add () {
    if [[ ! -f /home/niklas/.config/irssi/scripts/available/"$@".pl ]]; then
        wget  \
            -P "$HOME"/.config/irssi/scripts/available/ \
            https://github.com/irssi/scripts.irssi.org/blob/gh-pages/scripts/"$@".pl \
            &> /dev/null
    fi
}
