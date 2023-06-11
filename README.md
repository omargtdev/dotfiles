# dotfiles
"." files

## Table of Contents
* [General Information](#general-information)
* [Setup](#setup)
* [Usage](#usage)
* [Configs](#configs)
<!--* [Room for Improvement](#room-for-improvement)-->

## General Information
- Repo to store all configurations to be ready on every clean installation
of linux, or at least that is what I want :p.
- It is being handled with `stow`.

## Setup

### Prerequisites
You need to install [stow](https://www.gnu.org/software/stow/) to be able to manage dotfiles.
In simple terms, `stow` create symbolic links easily. You can learn more about using `man stow`.

Then, you can clone/fork this repo and you got it!

## Usage
To add a new dotfile, you can create a directory, for example `bash`, and then add 
a file to the folder, for example `.bashrc`.

Then create the symbolic link with `stow`:
```bash
stow bash
```

It would take all files inside `bash` directory and create in $HOME (for default) symbolic
links:
```bash
lrwxrwxrwx@ 22 omargtdev 9 Jun 21:16 .bashrc -> .dotfiles/bash/.bashrc
```

You can delete the symbolic links with:
```bash
stow -D bash
```

If you do not want to create the names with ".", you can use "dot-" prefix to the files like
`.bashrc -> dot-bashrc` and then adding the --dotfiles parameter:
```bash
stow --dotfiles bash
```

If you want to set in an specific location, use "-t" and pass the path:
```bash
stow -t path/to/set/directory directory
```

> INFO: For delete links that were created with other parameters like "-t" or "--dotfiles", 
> you need to specify them too. For example: `stow -D -t path/to/set/directory directory`.

## Configs
- [i3](./config/i3) (Tiling Window Manager)
- [alacritty](./config/alacritty) (Terminal)
- [kitty](./config/kitty) (Kitty)
- [bash](./bash) (Shell)
- [zsh](./zsh) (Shell)
