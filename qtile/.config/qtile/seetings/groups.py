from libqtile.config import Match, Group, Key
from libqtile.lazy import lazy
from .keys import keys, mod

list_group = {
    "web" : {
        "icon" : "",
        "matches" : [Match(wm_class=["firefox"])],
        "layout_default" : None
    },
    "terminal" : {
        "icon" : "",
        "matches" : None,
    },
    "dev" : {
        "icon" : "",
        "matches" : [Match(wm_class=["code"])],
    },
    "social" : {
        "icon" : "",
        "matches" : [Match(wm_class=["discord","telegram-desktop"])],
    },
    "spotify" : {
        "icon" : "",
        "matches" : [Match(wm_class=["spotify"])],
        "layout_default" : "max",
        "spawn" : "spotify"
    },
    "file_manager" : {
        "icon" : "",
        "matches" : [Match(wm_class=["thunar"])],
    },
    "multimedia" : {
        "icon" : "",
        "matches" : [Match(wm_class=["vlc","geeqie"])],
    }
}

groups = [Group(x.get("icon"), x.get("matches"), layout=x.get("layout_default"), spawn=x.get("spawn")) for x in list_group.values()]

for i, ws_group in enumerate(groups):
    actual_key = str(i + 1)
    keys.extend([
        # mod + letter of group = switch to group
        Key([mod], actual_key, lazy.group[ws_group.name].toscreen()),

        # mod + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], actual_key, lazy.window.togroup(ws_group.name, switch_group=False))
    ])
