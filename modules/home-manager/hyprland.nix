{pkgs, lib, inputs, ... }:
let 
  hpkgs = inputs.hyprland-plugins.packages."${pkgs.system}";
in 
{
  imports = [ 
    ./hyprconfig/hyprpaper.nix  
    ./hyprconfig/waybar.nix 
  ];
  programs.kitty.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;

    # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    settings = {

      "$mod" = "SUPER";

      debug.disable_logs = false;

      bind = [
        "$mod, P, exec, reboot"
        "$mod, K, exec, kitty"
      ];
    };

    plugins = [
      # hpkgs.hyprbars
      # hpkgs.default
    ];
  };
  
  home.packages = with pkgs; [
    
    waybar
    hyprpaper
  ];
}
