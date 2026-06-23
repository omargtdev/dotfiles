fish_add_path /opt/homebrew/bin
fish_add_path ~/.local/bin
fish_add_path ~/.opencode/bin
fish_add_path ~/.dotnet
fish_add_path ~/.dotnet/tools

if type -q rbenv
    rbenv init - --no-rehash fish | source
end
