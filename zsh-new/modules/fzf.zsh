local fd_command="fd"
local bat_command="bat"

if command -v fdfind >/dev/null 2>&1; then
    fd_command="fdfind"
fi

if command -v batcat >/dev/null 2>&1; then
    bat_command="batcat"
fi

export FZF_DEFAULT_COMMAND="$fd_command --type f --hidden --strip-cwd-prefix"

# Ctrl-T uses fd
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# UI
export FZF_DEFAULT_OPTS='
  --height=60%
  --layout=reverse
  --border=rounded
  --prompt="  "
  --pointer="  "
  --preview-window=right:65%:wrap:border-left
'

export _FZF_PREVIEW_CMD="$bat_command --color=always --style=plain,numbers --line-range=:500 {}"
export FZF_CTRL_T_OPTS="--preview '$_FZF_PREVIEW_CMD'"

# File picker excluding hidden files (check bindings module)
_fzf_file_no_hidden() {
  local cmd result
  cmd="${FZF_DEFAULT_COMMAND/--hidden /}"
  result=$(eval "${cmd:-find . -type f}" | fzf --preview "$_FZF_PREVIEW_CMD") \
    && LBUFFER+="$result"  # LBUFFER is the text left of the cursor
  zle reset-prompt
}
zle -N _fzf_file_no_hidden

