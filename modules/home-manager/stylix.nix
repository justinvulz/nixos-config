{ config, pkgs, lib, inputs, ... }:

{

  stylix.enable = true;
  stylix.polarity = "dark";
  stylix.image = ./../../config/wallpaper/snow.jpg;
  # stylix.image = ./../../config/wallpaper/ave_mv_m.png;

  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";
  stylix.cursor.size = 25;

  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml\n";

  # stylix.targets.nixvim.enable = false;
  stylix.targets.helix.enable = false;
  stylix.targets.spicetify.enable = false;

  stylix.base16Scheme = {
    base00 = "202020";
    base01 = "2a2827";
    base02 = "504945";
    base03 = "5a524c";
    base04 = "bdae93";
    base05 = "ddc7a1";
    base06 = "ebdbb2";
    base07 = "fbf1c7";
    base08 = "ea6962";
    base09 = "e78a4e";
    base0A = "d8a657";
    base0B = "a9b665";
    base0C = "89b482";
    base0D = "7daea3";
    base0E = "d3869b";
    base0F = "bd6f3e";

  };

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
