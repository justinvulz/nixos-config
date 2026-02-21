{
  config,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    # ./wm/hyprpaper.nix
    ./wm/waybar.nix
    ./wm/misc.nix
  ];

  programs.fuzzel.enable = true;

  xdg.configFile."niri/config.kdl".source = ../../config/niri/config.kdl;
  xdg.portal = {
    enable = true;
    config.common.default = [ "gnome" ];
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };
  programs.alacritty = {
    enable = true;
    settings = lib.mkForce {
      window.decorations = "None";
    };
  };
  #wallpaper

  home.packages = with pkgs; [
    xwayland-satellite
    gnome-keyring
    nautilus
    swaybg
  ];

}
