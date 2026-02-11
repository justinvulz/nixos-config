{
  config,
  lib,
  pkgs,
  ...
}:
{
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
