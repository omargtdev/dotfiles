# Bash
Configuration for bash shell.

## Shell startup explanation
Well, as much as bash, zsh or any other shell, follow an path for startup, that is,
they execute a certain number of files in specify order depending on the mode (login, non-login and/or interactive, non-interactive).
You can read more about this in:
- [unix shell initalization](https://github.com/pyenv/pyenv/wiki/Unix-shell-initialization) - from pyenv repository
- [shell startup](https://blog.flowblok.id.au/2013-02/shell-startup-scripts.html) - from this post by Peter Ward
- `man bash` - from bash man docs

## Requirements
You will need the following packages to set up correctly (unless you remove them, like alias):

- [exa](https://github.com/ogham/exa) - better `ls`
- [nvim](https://github.com/neovim/neovim) - personal editor, you can change/remove from configuration it if you want to
- [bat](https://github.com/sharkdp/bat) - better `cat`
- [xclip](https://github.com/sharkdp/bat) - xorg clipboard
