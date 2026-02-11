{ pkgs, lib, config, ... }:
let inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    terminal = "${pkgs.kitty}/bin/kitty";
    extraConfig = {
      modi = "drun";
      font = "Noto Sans 15";
      show-icons = true;
      drun-display-format = "{icon}   {name}";
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      display-window = " 🗗  Wins ";
      # sidebar-mode = true;
    };
    theme = {
      window = {
        width = mkLiteral "25em";
        border-radius = mkLiteral "0.5em";
        border = mkLiteral "0.1em";
        padding = mkLiteral "0.5em";
      };
      element = {
        padding = mkLiteral "0.15em";
        margin = mkLiteral "0.1em";
        border-radius = mkLiteral "0.5em";
      };
      listview = {
        lines = 5;

        # kasdljf;
      };
      inputbar = {
        border-radius = mkLiteral "0.5em";
        border = mkLiteral "0.15em";
        padding = mkLiteral "0.2em";
        margin = mkLiteral "0.2em 0em 0.5em";
        prompt = "hi";
      };

      element-icon.size = mkLiteral "1em";
    };
  };

}
