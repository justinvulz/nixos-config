{config,pkgs, lib, inputs, ... }:
{
  imports = [ 
    ./hypr/hyprpaper.nix  
    ./hypr/waybar.nix 
    ./hypr/pypr.nix
  ];
  programs.kitty.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    plugins = with pkgs.hyprlandPlugins; [
      # borders-plus-plus
      hyprexpo
    ] ++ [
      #inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    ];

    settings = {

      "$mod" = "SUPER";
      "$key" = "TAB";

      debug.disable_logs = false;

      bind = [
	      "$mod, Q, killactive"
        "$mod, B, exec, pypr expose"
        "$mod, $key, hyprexpo:expo, toggle"
        "ALT, $key, cyclenext,"
        "$ALT, A, workspace, -1"  
        "$ALT, S, workspace, +1"  
        "$mod SHIFT, Right, movetoworkspace, +1"
        "$mod SHIFT, Left, movetoworkspace, -1"
      ];
      bindm = [
        "ALT, mouse:272, movewindow"
      ];
      bindl = [
        "$mod, $mod_L, exec, pkill rofi || rofi -show run"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 3%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];
      windowrule = [
        "pseudo, fcitx"
      ];
      exec-once = [
      	"pypr" 
      	"waybar"
        "hyprpaper"
	      "dunst"
	      "fcitx5 -d -r"
	      "fcitx5-remote -r"
        # "hyprswitch init --show-title &"
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
      # "plugin:borders-plus-plus" = {
      #   add_borders = 1;
	    #   border_size_1 = 10;
      #   col.border_1 = lib.mkForce "rgb(0x4287f5)";
      #   natural_rounding = "yes";
      # };

      # device = {
      #   name = "sinowealth-game-mouse";
      #   sensitivity = -0.10;
      # };
      plugin = {
        hyprexpo = {
          workspace_method = "center current";
          gap_size = 10;

        };

      };
    };

  };
  

  home.packages = with pkgs; [
    dunst
    pyprland
    rofi-wayland
    wlogout
    # hypridle
    # bemenu
    # wofi
    wev
    # inputs.hyprswitch.packages.x86_64-linux.default
  ];
}
