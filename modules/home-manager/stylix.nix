{ config, pkgs,lib, inputs, ... }:

{
  stylix.enable = true;
  stylix.polarity = "dark";
  stylix.image = ./../../config/wallpaper/01.jpg;
    stylix.fonts = {
    serif = {
    package = pkgs.dejavu_fonts;
    name = "DejaVu Serif";
    };

    sansSerif = {
    package = pkgs.dejavu_fonts;
    name = "DejaVu Sans";
    };

    monospace = {
    package = pkgs.dejavu_fonts;
    name = "DejaVu Sans Mono";
    };

    emoji = {
    package = pkgs.noto-fonts-emoji;
    name = "Noto Color Emoji";
    };
  };

}
