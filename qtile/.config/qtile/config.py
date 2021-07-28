import os, subprocess
from typing import List  # noqa: F401

from libqtile import hook
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, Match
from libqtile.lazy import lazy

mod = "mod4"
alt = "mod1"
terminal = "alacritty"

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"), 
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    #Key([mod], "r", lazy.spawncmd(),
    #    desc="Spawn a command using a prompt widget"),

    # rofi menu
    Key([mod], "m", lazy.spawn("rofi -show run")),
    Key([mod, "shift"], "m", lazy.spawn("rofi -show")),

    # Personalize
    Key([mod], "b", lazy.spawn("firefox")),
    Key([mod], "d", lazy.spawn("discord")),

    # volume
    # https://wiki.linuxquestions.org/wiki/List_of_keysyms
    Key([mod, alt], "minus", lazy.spawn("pamixer --decrease 5")),
    Key([mod, alt], "plus", lazy.spawn("pamixer --increase 5")),
    Key([mod, alt], "m", lazy.spawn("pamixer --toggle-mute")),

    # Screenshoot 
    Key([], "Print", lazy.spawn("flameshot gui")),

    # Redshift (set brightness)
    Key([mod], "r", lazy.spawn("redshift -O 2400")),
    Key([mod, "shift"], "r", lazy.spawn("redshift -x")),

]

groups = [
  Group("", matches=[Match(wm_class=["firefox"])]),
  Group(""),
  Group(""),
  Group("", matches=[Match(wm_class=["discord"])]),
  Group("", spawn="spotify", layout="max"),
  Group("", matches=[Match(wm_class=["Thunar", "thunar"])]),
  Group("", matches=[Match(wm_class=["geeqie"])])
]

for i, ws_group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        # mod + letter of group = switch to group
        Key([mod], actual_key, lazy.group[ws_group.name].toscreen()),

        # mod + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], actual_key, lazy.window.togroup(ws_group.name, switch_group=False))
    ])
 

layout_conf = {
    'border_focus': "ffff9f",
    'border_width': 1,
}

margin_east=6
margin_layout = [4, margin_east, 4, 4]

layouts = [
    layout.MonadTall(
      **layout_conf,
      margin=margin_east
      
    ),
    layout.Columns(
      **layout_conf,
      margin=margin_layout
    ),
    layout.Matrix(
      **layout_conf,
      margin=margin_layout,
    ),
    layout.Max(),
]

widget_defaults = dict(
    font='UbuntuMono Nerd Font Bold',
    fontsize=14,
    padding=1,
)
extension_defaults = widget_defaults.copy()

def icon(text="?", color="333333", size=16):
  return widget.TextBox(
	   text=text,
	   background=color,
	   fontsize=size
	 )

def powerline(fg="1b182c",bg="ffffff"):
  return widget.TextBox(
	   text="",
	   fontsize=37,
	   padding=-2,
	   foreground=fg,
	   background=bg
	 )

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                  inactive="787878",
                  borderwidth=1,
                  fontsize=22,
                  highlight_method="block",
                  urgent_alert_method="block",
                  padding=10,
                  this_current_screen_border="959595",
                  urgent_text="ff4444",
                  urgent_border="ff4444",
                  disable_drag=True
                ),
                widget.WindowName(),
                powerline("1d2fa2", None),
                icon(" ", "1d2fa2"),
                widget.CheckUpdates(
                  background="1d2fa2",
                  display_format="{updates}",
                  no_update_string='0',
                  custom_command="checkupdates",
		  padding=5
                ),
                powerline("399f9d","1d2fa2"),
                icon(" ", "399f9d"),
                widget.Net(
                  background="399f9d",
                  interface="enp1s0",
		  padding=5
                ),
                powerline("bf8300", "399f9d"),
                icon(" ", "bf8300"),
                widget.Clock(
                  format='%d/%m/%Y - %H:%M ',
                  background="bf8300",
                ),
                powerline("4d9d3d", "bf8300"),
                widget.CurrentLayoutIcon(
                  background="4d9d3d",
                  scale=0.7
                ),
                widget.CurrentLayout(
                  background="4d9d3d",
                  padding=5,
                ),
                powerline(bg="4d9d3d"),
                widget.Systray(
                 padding=5,
                ),
                widget.Spacer(length=10), 
            ],
            24,
            background="1b182c",
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button1", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])
