# ~/.config/zsh/.zshenv

# ---------------- XDG Base directories ----------------
# Centralizes/specify config, cache and data locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# --------------------- Editor ---------------------
# Default editor used by git, k8s, etc.
#
# Logic for selecting the appropriate editor if one does
# not exist
if command -v nvim >/dev/null 2>&1; then
    export EDITOR="nvim"
elif command -v vim >/dev/null 2>&1; then
    export EDITOR="vim"
elif command -v vi >/dev/null 2>&1; then
    export EDITOR="vi"
else
    export EDITOR="nano"
fi


# ---------------- GPG ----------------
# When type a password requested by GPG,
# use the current teerminal
export GPG_TTY=$(tty)

# ------------ PATH ------------
# Personal binaries/scripts
export PATH="$HOME/.local/bin:$PATH"

# --------------- Pager ---------------
if command -v batcat >/dev/null 2>&1; then
    export MANPAGER="batcat -l man -p"
elif command -v bat >/dev/null 2>&1; then   
    export MANPAGER="bat -l man -p"
fi
