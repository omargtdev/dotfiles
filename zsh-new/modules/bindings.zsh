ZVM_SYSTEM_CLIPBOARD_ENABLED=true
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

function zvm_after_init() {

    # Ctrl+F -> fzf file picker (no hidden files)
    bindkey '^F' _fzf_file_no_hidden

    # Only overwrite Ctrl+R if fzf is installed and its widgets are loaded
    if zle -l | grep -q fzf-history-widget; then
        # Bind fzf specifically to the vi-insert mode (-M viins)
        bindkey -M viins '^R' fzf-history-widget
    fi
}
