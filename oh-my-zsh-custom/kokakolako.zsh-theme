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

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=" "

# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}*"

PROMPT="%{$fg[red]%}λ $(host)%{$reset_color%}%c $(git_prompt_info)%{$fg[red]%}> %{$reset_color%}"
RPROMPT="%{$fg[red]%}<%{$reset_color%}"

# PROMPT='%{$fg[red]%}λ %m %{$fg[green]%}%c %{$fg[yellow]%}→ $(git_prompt_info)%{$reset_color%}'
# ZSH_THEME_GIT_PROMPT_PREFIX="λ %{$fg[red]%}git %{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[red]%} → %{$reset_color%}"
