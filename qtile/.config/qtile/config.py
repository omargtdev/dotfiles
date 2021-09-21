import os, subprocess

from libqtile import hook

from seetings.keys import keys
from seetings.groups import groups
from seetings.layouts import layouts, floating_layout
from seetings.widgets import widget_defaults, extension_defaults
from seetings.screens import screens
from seetings.mouse import mouse

main = None
dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
wmname = "LG3D"


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])
