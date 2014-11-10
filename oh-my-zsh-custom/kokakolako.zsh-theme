# ZSH Theme

host () {
    if [[ "$HOST" != "rayquaza" ]]; then
        echo -e "%{$fg[red]%}%m "
    fi
}

user () {
    if [[ "$USER" != "niklas" ]]; then
        echo -e "%n"
    fi
}

prefix () {
    if [[ $? == 0 ]]; then
        echo -e "$"
    else
        echo -e "!"
    fi
}

PROMPT='%{$fg[red]%}$(prefix) $(host)%{$reset_color%}%c $(git_prompt_info)%{$fg[red]%}> %{$reset_color%}'
# RPROMPT='%{$fg[red]%}<%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}* "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}* "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%b"
ZSH_THEME_GIT_PROMPT_PREFIX="%B"

# vim: set ft=zsh:
