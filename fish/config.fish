if status is-interactive
# Commands to run in interactive sessions can go here
    fish_add_path /opt/homebrew/bin
    fish_add_path ~/.local/bin
    fish_add_path ~/.opencode/bin

    if type -q rbenv
        rbenv init - --no-rehash fish | source
    end

    # bun
    set --export BUN_INSTALL "$HOME/.bun"
    set --export PATH $BUN_INSTALL/bin $PATH

    set -gx OMO_SEND_ANONYMOUS_TELEMETRY 0
end

