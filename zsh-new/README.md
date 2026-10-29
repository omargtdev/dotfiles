# ZSH Configuration

We are going to set the config location variables for all users at `/etc/zsh/zshenv`.
> You can put this configuration in your local `.zshenv` file at the top level
```zsh
if [[ -z "$XDG_CONFIG_HOME" ]]; then
    export XDG_CONFIG_HOME="$HOME/.config"
fi

if [[ -d "$XDG_CONFIG_HOME/zsh" ]]; then
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
fi
```

## Configuration

### Software required
- `zoxide`: A smarter `cd`
- `fzf`: Fuzzy finder
- `fd`: `find` alternative
- `bat`: A better `cat`
- `eza`: A better `ls`
- `ripgrep`: A better `grep`
- `starship`: Shell prompt

- Core environment variables: `$ZDOTDIR/.zshenv`
- Main configuration file: `$ZDOTDIR/.zshrc`


