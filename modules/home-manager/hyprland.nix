{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./hypr/hyprpaper.nix
    ./hypr/waybar.nix
    # ./hypr/pypr.nix
  ];

  programs.kitty = {
    enable = true;
    settings = {
      dynamic_background_opacity = true;
    };

  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {

      "$mod" = "SUPER";
      "$key" = "TAB";
      "$mov" = "ALT";
      # "$mov" = "CTRL";

      debug.disable_logs = false;

      bind = [
        "$mod, Q, killactive"
        "$mov, $key, cyclenext,"
        "$mov, A, workspace, -1"
        "$mov, S, workspace, +1"
        "$mod SHIFT, Right, movetoworkspace, +1"
        "$mod SHIFT, Left, movetoworkspace, -1"
        ''
          $mod SHIFT, S, exec, grim -g "$(slurp)" - | wl-copy && wl-paste > ~/Picture/Screenshots/Screenshot-$(date +%F_%T).png | dunstify "Screenshot of the region taken" -t 1000 # screenshot of a region
        ''
        "$mod, F,fullscreen"
      ];
      bindm = [
        "$mov, mouse:272, movewindow"
        "$mov, mouse:273, resizewindow"
      ];
      bindl = [
        "$mod, $mod_L, exec, pkill rofi || rofi -show drun"
        "$mod, $key, exec, pkill rofi || rofi -show window"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];
      windowrulev2 = [
        "float, title:子母畫面"
        "float, class:yad"
        # "float, class:spotify"
      ];
      exec-once = [
        "pypr"
        "waybar"
        "hyprpaper"
        "dunst"
        "fcitx5 -d -r"
        "fcitx5-remote -r"
      ];

      general = {
        "col.active_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.base07})";
      };

      decoration = {
        "rounding" = 10;
      };

      input = {
        follow_mouse = 2;
      };

      monitor = [
        "desc:Microstep MSI MP253 PC7H054600589, highrr,auto,1"
        "desc:ViewSonic Corporation VX2728-QHD X25220100001, preferred,0x1080,1"
        "desc: AU Optronics 0x479D, preferred, 0x0,1"
        ", preferred, auto, 1"
      ];

    };

  };

  # xdg.configFile."rofi/config.rasi".source = ../../config/rofi/config.rasi;

  services.dunst = {
    enable = true;
    # defaultEditor = true;
  };
  home.packages = with pkgs; [
    # pyprland
    wlogout
    # hypridle
    wev
    # inputs.hyprswitch.packages.x86_64-linux.default
  ];
}
