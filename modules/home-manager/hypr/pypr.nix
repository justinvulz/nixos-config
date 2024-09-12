{config, lib, pkgs, ... }:
let
  conf =  /* toml */''

[pyprland]
plugins = [
  "scratchpads",
  "magnify",
  "expose",
  "shortcuts_menu",
  "toggle_special",
]

[scratchpads.term]
command = "wezterm start --always-new-process --class wezterm_dropdown"
animation = "fromTop"
unfocus = "hide"
excludes = "*"
lazy = true
multi = false

[scratchpads.volume]
command = "pavucontrol --class volume_sidemenu"
animation = "fromLeft"
class = "volume_sidemenu"
size = "40% 70%"
unfocus = "hide"
excludes = "*"
lazy = true
margin = 90
multi = false

[shortcuts_menu.entries]

"Color picker" = [
    {name="format", options=["hex", "rgb", "hsv", "hsl", "cmyk"]},
    "sleep 0.2; hyprpicker --format [format] -a" # sleep to let the menu close before the picker opens
]
'';

in
{

 xdg.configFile."hypr/pyprland.toml".text = conf;

}
