# ==========================
# Completions
# ==========================
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
fpath=(~/.config/zsh/completions $fpath)
autoload -Uz compinit
compinit -C -d "$ZDOTDIR/.zcompdump"

# ==========================
# Options & Utilities
# ==========================
eval "$(dircolors -b)"
eval "$(fzf --zsh)"

# ==========================
# Prompt & Styling
# ==========================
source /opt/homebrew/etc/bash_completion.d/git-prompt.sh

setopt PROMPT_SUBST
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWCONFLICTSTATE=1

zle_highlight=(default:bold)

# Empty line before prompt
_prompt_initialized=0
precmd() {
    (( _prompt_initialized )) && echo
    _prompt_initialized=1
}

# Refresh tmux status bar on directory change
chpwd() {
    [[ -n "$TMUX" ]] && tmux refresh-client -S
}

if [[ -n "$TMUX" ]]; then
    PROMPT='%B%(?.%F{2}.%F{1})%#%f%b '
else
    PROMPT='%B%F{8}%~%f %F{1}$(__git_ps1 " %s")%f
%(?.%F{2}.%F{1})%#%f%b '
fi

# ==========================
# Aliases
# ==========================
alias ll='ls -oFAh --group-directories-first --color=auto'
alias lt='ls -ohFAt --color=auto'
alias grep='grep --color=auto'
alias pve='python -m venv --prompt python-venv .python-venv && source .python-venv/bin/activate'

# ==========================
# Local/Extra Config
# ==========================
if [[ -f ~/.config/adobe/zshrc ]]; then
    source ~/.config/adobe/zshrc
fi
