{ pkgs, lib, ... }:
{
  programs.yazi = {
    enable = true;
    enableNushellIntegration = true;
    shellWrapperName = "y";
  };
}
