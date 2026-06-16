# Tmux
abbr --add txs ~/.config/tmux/scripts/tmux-session
abbr --add tx-delete-all ~/.config/tmux/scripts/tmux-delete-session

# K8S
abbr --add k kubectl
abbr --add k-contexts kubectl config get-contexts
abbr --add k-use kubectl config use-context
abbr --add k-current kubectl config current-context

# Editor
if command -q nvim
    abbr --add v nvim
else
    abbr --add v vim
end

# Others
abbr --add pt papertrail

# Docker
#abbr --add redis-cli docker run -e 'REDISCLI_AUTH=$REDISCLI_AUTH' -it --rm redis  redis-cli
abbr --add psql docker run -ti --rm alpine/psql
