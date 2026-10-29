# Homebrew
switch (uname)
    case Darwin
        fish_add_path /opt/homebrew/bin
    case Linux
        fish_add_path /home/linuxbrew/.linuxbrew/bin
end

fish_add_path ~/.local/bin
fish_add_path ~/.opencode/bin
fish_add_path ~/.dotnet
fish_add_path ~/.dotnet/tools

if type -q rbenv
    rbenv init - --no-rehash fish | source
end

if type -q nvm
    nvm install lts > /dev/null
end
