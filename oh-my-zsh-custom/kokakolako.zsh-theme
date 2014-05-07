# ZSH Theme

host () {
    if [[ "$HOST" != "turtok" ]]; then
        echo "%{$fg_bold[yellow]%}%m%{$reset_color%} "
    fi
}

user () {
    if [[ "$USER" != "niklas" ]]; then
        echo "%n"
    fi
}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}*"

PROMPT="%{$fg_bold[yellow]%}λ $(host)%{$reset_color%}%c $(git_prompt_info)%{$fg_bold[yellow]%}> %{$reset_color%}"
RPROMPT="%{$fg_bold[yellow]%}<%{$reset_color%}"

