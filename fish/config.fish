if status is-interactive
# Commands to run in interactive sessions can go here
  fish_add_path /opt/homebrew/bin
  fish_add_path ~/.local/bin
  fish_add_path ~/.opencode/bin

  if type -q rbenv
    rbenv init - --no-rehash fish | source
  end
end
