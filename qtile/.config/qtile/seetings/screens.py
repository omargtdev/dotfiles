from libqtile import bar
from libqtile.config import Screen
from .widgets import primary_widgets

screens = [Screen(top=bar.Bar(primary_widgets, 24, background="1b182c"))]
