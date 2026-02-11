{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./wm/hyprpaper.nix
    ./wm/waybar.nix
    ./wm/misc.nix
  ];

  programs.fuzzel.enable = true;

  programs.kitty = {
    enable = true;
    settings = {
      dynamic_background_opacity = true;
    };

  };

  xdg.configFile."niri/config.kdl".source = ../../config/rofi/config.rasi;
  home.packages = with pkgs; [
    alacritty # terminal
    xwayland-satellite
  ];

}
