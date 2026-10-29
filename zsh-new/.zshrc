# =============================================
# History
# =============================================

if [[ ! -d "$XDG_STATE_HOME/zsh" ]]; then
    mkdir -p "$XDG_STATE_HOME/zsh"
fi
HISTFILE="$XDG_STATE_HOME/zsh/history"

HISTSIZE=100000 # Current memory session
SAVEHIST=100000 # Saved in history file

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS # Ignore duplicates
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS

# =============================================
# Shell behavior
# =============================================

setopt AUTOCD
setopt NOBEEP
setopt NUMERIC_GLOB_SORT # sort file10 after file9, not after file1

# =============================================
# Smart directory navigation
# =============================================

# Initialize zoxide
eval "$(zoxide init zsh)"

# =============================================
# Completion
# =============================================

# Load completion system
autoload -Uz compinit

# Initialize completion with cached metadata file
if [[ ! -d "$XDG_CACHE_HOME/zsh" ]]; then
    mkdir -p "$XDG_CACHE_HOME/zsh"
fi
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# Enable interactive completion menu selection
zstyle ':completion:*' menu select

# Make completion case-insensitive (lower to upper)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# =============================================
# Fuzzy finder
# =============================================

# macOS / Homebrew (Apple Silicon)
if [[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ]]; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh
  source /opt/homebrew/opt/fzf/shell/completion.zsh
fi

# macOS / Homebrew (Intel)
if [[ -f /usr/local/opt/fzf/shell/key-bindings.zsh ]]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# Arch
if [[ -f /usr/share/fzf/key-bindings.zsh ]]; then
  source /usr/share/fzf/key-bindings.zsh
  source /usr/share/fzf/completion.zsh
fi

# Ubuntu
if [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
  source /usr/share/doc/fzf/examples/key-bindings.zsh
  source /usr/share/doc/fzf/examples/completion.zsh
fi

# Local Git-cloned fzf
if [[ -f "$HOME/.fzf/shell/key-bindings.zsh" ]]; then
  source "$HOME/.fzf/shell/key-bindings.zsh"
  source "$HOME/.fzf/shell/completion.zsh"
fi

# =============================================
# Modules
# =============================================

source "$ZDOTDIR/modules/plugins.zsh"
source "$ZDOTDIR/modules/prompt.zsh"
source "$ZDOTDIR/modules/fzf.zsh"
source "$ZDOTDIR/modules/aliases.zsh"
source "$ZDOTDIR/modules/bindings.zsh"

# =============================================
# Local configuration
# =============================================
source "$ZDOTDIR/.zshrc.local"
