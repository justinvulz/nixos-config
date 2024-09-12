{pkgs, lib, inputs, ... }:
{
  imports = [ 
    ./hypr/hyprpaper.nix  
    ./hypr/waybar.nix 
    ./hypr/pypr.nix
  ];
  programs.kitty.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    # package = inputs.hyprland.packages.${pkgs.system}.default;

    # plugins = with inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system};[
    #   borders-plus-plus
    #   hyprbars
    # ];
    plugins = with pkgs.hyprlandPlugins; [
      # hyprbars
      borders-plus-plus
    ];

    settings = {

      "$mod" = "SUPER";
      "$key" = "TAB";

      debug.disable_logs = false;

      bind = [
	"$mod, Q, killactive"
        "$mod, B, exec, pypr expose"
        # "$mod, $key ,exec, hyprswitch gui"
      ];
      bindm = [
        "ALT, mouse:272, movewindow"
      ];
      bindl = [
        "$mod, $mod_L, exec, pkill rofi || rofi -show run"
      ];
      workspace = "special:expose,gapsout:60,gapsin:30,bordersize:5,border:true";
      exec-once = [
      	"pypr" 
      	"waybar"
        "hyprpaper"
	"dunst"
        # "hyprswitch init &"
      ];
      

      "plugin:borders-plus-plus" = {
        add_borders = 1;
	border_size_1 = 10;
        natural_rounding = "yes";
      };
    };

  };
  
  

  home.packages = with pkgs; [
    dunst
    pyprland
    waybar
    hyprpaper
    rofi-wayland
    # inputs.hyprswitch.packages.x86_64-linux.default
  ];
}
