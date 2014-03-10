PROMPT='%B%{$fg[yellow]%}λ%b $(print_host)%{$reset_color%}%c $(git_prompt_info)%B%{$fg[yellow]%}>%b %{$reset_color%}'
ZSH_THEME_GIT_PROMPT_PREFIX="%B"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%b "
ZSH_THEME_GIT_PROMPT_DIRTY="%{%B$fg[yellow]%}*%b"
ZSH_THEME_GIT_PROMPT_CLEAN="%{%B$fg[green]%}*%b"

print_host () {
    if [[ "$HOST" != "turtok" ]]; then
        echo "%{$fg[yellow]%}%%Bm%b%{$reset_color%} "
    fi
}

print_user () {
    if [[ "$USER" != "niklas" ]]; then
        echo "%n"
    fi
}

