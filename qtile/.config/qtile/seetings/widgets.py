from libqtile import widget
from os import path
from .path import qtile_path
import json

f = open(path.join(qtile_path, "colors_widgets.json"))

theme = json.load(f)

def icon(text="?", bg="333333", size=16):
    return widget.TextBox(
        text=text,
        background=bg,
        fontsize=size
	)

def powerline(fg=theme["bar"] ,bg="ffffff"):
    return widget.TextBox(
        text="",
        fontsize=37,
        padding=-2,
        foreground=fg,
        background=bg
	)

primary_widgets = [
    widget.GroupBox(
      inactive="787878",
      borderwidth=1,
      fontsize=20,
      highlight_method="block",
      urgent_alert_method="block",
      padding=10,
      this_current_screen_border="959595",
      urgent_text="ff4444",
      urgent_border="ff4444",
      disable_drag=True
    ),
    widget.WindowName(),
    powerline(theme["color1"], None),
    icon(" ", theme["color1"]),
    widget.CheckUpdates(
      background=theme["color1"],
      display_format="{updates}",
      no_update_string='0',
      custom_command="checkupdates",
       padding=5
    ),
    powerline(theme["color2"],theme["color1"]),
    icon(" ", theme["color2"]),
    widget.Net(
      background=theme["color2"],
      interface="enp1s0",
      padding=5
    ),
    powerline(theme["color3"], theme["color2"]),
    icon(" ", theme["color3"]),
    widget.Clock(
      format='%d/%m/%Y - %H:%M ',
      background=theme["color3"],
    ),
    powerline(theme["color4"], theme["color3"]),
    widget.CurrentLayoutIcon(
      background=theme["color4"],
      scale=0.7
    ),
    widget.CurrentLayout(
      background=theme["color4"],
      padding=5,
    ),
    powerline(bg=theme["color4"]),
    widget.Systray(
     padding=5,
    ),
    widget.Spacer(length=10),
]

widget_defaults = dict(
    font='UbuntuMono Nerd Font Bold',
    fontsize=14,
    padding=1,
)

extension_defaults = widget_defaults.copy()
