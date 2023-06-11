# i3 config
This is my i3 configuration, based on other configs and investigate about how it works

## Table of Contents
* [General Info](#general-information)
* [Features](#features)
* [Screenshots](#screenshots)
* [Setup](#setup)
* [Usage](#usage)
* [Room for Improvement](#room-for-improvement)

## General Information
I wanted always learn about how to configure tiling windows managers in Linux,
because I feel that Windows lacks those features.

## Features
- An custom bar made with i3blocks instead of i3status
- Ready to use keys for laptops (volume, lightness, etc)

## Setup

### Prerequisites
Once you have your i3 window manager installed on your favorite distro, you will need
the following packages and fonts to run this config correctly.

> `INFO`: This configuration was tested with xorg only.

> `INFO`: Each installation may vary depending on your distro, check how each package 
> is installed in your specific distro (Debian, Fedora, Arch, etc).

> `INFO`: If you want add the configurations of this repo for some services and apps like
> alacritty, go ahead, otherwise you can put your own configuration.
 
#### Fonts
The font that this config uses is [Hack Nerd Font](https://www.nerdfonts.com/font-downloads).
Of course, you can install the whatever you want and change it.

#### Packages
The following packages are necessary, because is being used in the configuration. As I say,
the installation of each package may vary depending on your distro.

- [nm-applet](https://github.com/GNOME/network-manager-applet) - Systray to manage network connections and configurations
- [pavucontrol](https://github.com/pulseaudio/pavucontrol) - GUI based on GTK to manage volume for PulseAudio
- [flameshot](https://github.com/flameshot-org/flameshot) - Screenshot tool
- [acpi](https://archlinux.org/packages/extra/x86_64/acpi/) - Show battery status and other utilities
- [setxkbmap](https://archlinux.org/packages/extra/x86_64/xorg-setxkbmap/) CLI to change keyboard layout
- [dunst](https://archlinux.org/packages/extra/x86_64/dunst/) - Notification manager
- [brillo](https://gitlab.com/cameronnemo/brillo) - Control backlight like xbacklight, but an better one
- [playerctl](https://github.com/altdesktop/playerctl)  - Control player like spotify, browser, etc
- [alacritty](https://github.com/alacritty/alacritty) - Default terminal
- [firefox](https://www.mozilla.org/es-ES/firefox/new/) - Default browser
- [dmenu](https://archlinux.org/packages/extra/x86_64/dmenu/) - Minimalist menu to run applications
- [xrandr](https://archlinux.org/packages/extra/x86_64/xorg-xrandr/) - Control displays through CLI
- [picom](https://github.com/yshui/picom) - Compositor to make shadows and transitions
- [i3blocks](https://github.com/vivien/i3blocks) - Set an custom i3 bar
- [betterlockscreen](https://github.com/betterlockscreen/betterlockscreen) - Set amazing lockscreen and background wallpapers (Set service to autolock in suspend/hibernate)
- [autotiling](https://github.com/nwg-piotr/autotiling) - Open windows determinating its size automatically (Only in tailing mode)
- [xautolock](https://archlinux.org/packages/extra/x86_64/xautolock/) - Lock system to screen-saver

## Usage
Well, for now. I did not a cheatseet to specify "what commands does that",
but you can checkout in the [config](./config) file.

## Room for improvement
Although things are missing in this config, it works fine.

### TODO

- [ ] Fix wallpaper in second screen (xrandr)
- [ ] Add acknowledgements
