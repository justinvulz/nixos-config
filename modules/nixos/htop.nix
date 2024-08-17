{ config, pkgs,lib, inputs, ... }:

{
  programs.htop = {
    enable = lib.mkDefault true;
  };

}