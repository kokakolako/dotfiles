# ZSH Theme

host () {
    if [[ "$HOST" != "turtok" ]]; then
        echo "%{$fg[red]%}%m "
    fi
}

user () {
    if [[ "$USER" != "niklas" ]]; then
        echo "%n"
    fi
}

PROMPT='%{$fg[red]%}λ $(host)%{$reset_color%}%B%c%b $(git_prompt_info)%{$fg[red]%}> %{$reset_color%}'
# RPROMPT='%{$fg[red]%}<%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}* "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}* "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}"

