# editing config files
# ---------------------------------------------
alias hconfig="vim -c \"lcd $HOME/.config/herbstluftwm\" $HOME/.config/herbstluftwm/{autostart,panel}"
alias iconfig="vim -c \"lcd $HOME/.config/i3\" $HOME/.config/i3/config "
alias nconfig="vim -c \"lcd $HOME/.config/ncmpcpp\" $HOME/.config/ncmpcpp/config"
alias sconfig="vim -c \"lcd $HOME/.config/sxhkd\" $HOME/.config/sxhkd/sxhkdrc "
alias tconfig="vim -c \"lcd $HOME/.config/tmux\" $HOME/.config/tmux/tmux.conf"
alias uconfig="vim -c \"lcd $HOME/.config/X11\" $HOME/.config/X11/Xresources "
alias vconfig="vim -c \"lcd $HOME/.config/vim\" $HOME/.config/vim/{vimrc,extend.vim}"
alias zconfig="vim -c \"lcd $HOME/.config/zsh\" $HOME/.config/{alias.sh,zsh/zshrc}"

# programs
# ---------------------------------------------
alias emacs="emacs -nc"
alias abcde="abcde -c $HOME/.config/abcde/abcde.conf"
alias bc="bc -q"
alias eclipse="eclipse -nosplash"
alias emerge="emerge --quiet-build=y"
alias ffplay="ffplay -loglevel quiet"
alias gimp="gimp --no-splash"
alias git="LANG=en_us git"
alias grep="grep --color=auto"
alias info="info --vi-keys"
alias ipv4_addr="curl ipv4.icanhazip.com"
alias ipv6_addr="curl ipv6.icanhazip.com"
alias ipython="ipython --no-banner --nosep"
alias irssi="sudo irssi --nick kokakolako --home /home/niklas/.config/irssi/"
alias la="\ls -A --color"
alias ll="\ls -Alh1 --color"
alias lss="\ls -Ash1 --color"
alias locate="locate --regex"
alias ls="ls --color --ignore __pycache__"
alias minecraft="DRI_PRIME=1 java -jar "$HOME"/.opt/Minecraft.jar"
alias mpv="DRI_PRIME=1 mpv --input-file=$HOME/.config/mpv/mpv-control -vo=opengl-hq"
alias ncmpcpp="ncmpcpp -c $HOME/.config/ncmpcpp/config"
alias newsbeuter="newsbeuter -u ~/.config/newsbeuter/urls -C ~/.config/newsbeuter/config -r 2> /dev/null"
alias open_with_amd="DRI_PRIME=1 $@"
alias pandoc="~/.cabal/bin/pandoc"
alias redshift="redshift -l 51.43072:7.16941 &> /dev/null &"
alias vim="vim -u $HOME/.config/vim/vimrc"
alias rm="/home/niklas/tra.sh"

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

# shortcuts
# ---------------------------------------------
alias A="alsamixer"
alias E="emacs"
alias H="herbstclient"
alias N="ncmpcpp"
alias V="vim"

# sudo-shortcuts
# ---------------------------------------------
alias blkid="sudo blkid"
alias emerge="sudo emerge"
alias layman="sudo layman"
alias poweroff="mpc pause &> /dev/null && sudo poweroff"
alias reboot="sudo reboot"
alias shutdown="sudo shutdown"
alias mount="sudo mount"
alias umount="sudo umount"

# make directory and cd into it
# ---------------------------------------------
function mcd () {
    dir="$@"
    mkdir -p $dir
    cd $dir
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

# download images from 4chan thread
# ---------------------------------------------
function 4chan-dl () {
    local url="${1}"
    local thread="$( \
        curl ${url//boards.4chan/a.4cdn}.json \
        | jq '.posts[0].sub' \
        | tr -d '\/\\'
    )"
    curl "$url" \
    | grep -Eo 'href="[^"]*.(jpg|png|gif|webm)' \
    | sort | uniq \
    | sed 's/href="/http:/g' \
    | xargs -I {} wget {} --directory-prefix=${thread//\"/} \
}

# reload tmux
# ---------------------------------------------
function tmux-reload () {
    tmux source-file $HOME/.config/tmux/tmux.conf > /dev/null
    [ $? -eq 0 ] \
        && printf "Sucessfully reloaded the tmux.conf file\n" \
        || printf "An error occured while trying to reload the tmux.conf file\n"
}


# reload sxhkd
# ---------------------------------------------
function sxhkd-reload () {
    kill -s USR1 "$( pidof sxhkd )" > /dev/null
    [ $? -eq 0 ] \
        && printf "Sucessfully reloaded the sxhkdrc file\n" \
        || printf "An error occured while trying to reload the sxhkdrc file\n"
}

# colorized "dirs", "pushd", "popd"
# ---------------------------------------------
function dirs () {
    ## to use the builtin dirs command the command must be invoked via "builtin"
    local lines=$( builtin dirs -v | wc -l )
    local lines=$(( $lines - 1 ))
    local color
    for (( stack_pos = 0; stack_pos <= $lines; stack_pos++ )); do
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
