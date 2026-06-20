if status is-interactive
# Commands to run in interactive sessions can go here
  fish_add_path /opt/homebrew/bin
  fish_add_path ~/.local/bin
  fish_add_path ~/.opencode/bin

  fish_add_path ~/.dotnet
  fish_add_path ~/.dotnet/tools

  if type -q rbenv
    rbenv init - --no-rehash fish | source
  end
end

# opencode
fish_add_path /home/linuxero/.opencode/bin
