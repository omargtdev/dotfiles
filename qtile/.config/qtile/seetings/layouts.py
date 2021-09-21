from libqtile import layout
from libqtile.config import Match

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
