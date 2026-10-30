alias reload='source $ZDOTDIR/.zshenv; source $ZDOTDIR/.zshrc'

# Readable output
alias df='df -h'
alias du='du -h'
alias free='free -mt'

# k8s
alias k='kubectl'
alias k-contexts='kubectl config get-contexts'
alias k-use='kubectl config use-context'
alias k-current='kubectl config current-context'
alias k-set-ns='kubectl config set-context --current --namespace'

# Tools
alias ls='eza --icons'

local bat_command='bat'
if command -v batcat >/dev/null 2>&1; then
    bat_command='batcat'
fi
alias cat=$bat_command

if command -v nvim >/dev/null 2>&1; then
    alias v='nvim'
elif command -v vim >/dev/null 2>&1; then
    alias v='vim'
else
    alias v='vi'
fi

# Tmux
alias txs='$XDG_CONFIG_HOME/tmux/scripts/tmux-session'
alias tx-delete-all='$XDG_CONFIG_HOME/tmux/scripts/tmux-delete-session'

