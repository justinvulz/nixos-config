{ pkgs, lib, ... }:
{
  programs.btop.enable = true;
  programs.btop.settings = lib.mkForce { color_theme = "Default"; };
}
