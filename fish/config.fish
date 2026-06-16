if status is-interactive
# Commands to run in interactive sessions can go here
  fish_add_path /opt/homebrew/bin
  fish_add_path ~/.local/bin
  fish_add_path ~/.opencode/bin
end

# Added by `rbenv init` on Mon Jun  8 01:18:32 -05 2026
status --is-interactive; and rbenv init - --no-rehash fish | source
