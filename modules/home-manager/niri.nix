{
  niri =
    {
      inputs,
      pkgs,
      ...
    }:
    {
      imports = with inputs.self.homeModules.wmModules; [
        misc
        waybar

      ];

      programs.fuzzel = {
        enable = true;
        settings = {
          main = {
            terminal = "kitty -e";
            width = 50;
            # vertical-pad = 10;
            horizontal-pad = 15;
          };
        };
      };

      xdg.configFile."niri/config.kdl".source = ../../config/niri/config.kdl;
      xdg.configFile."niri/current-wallpaper".source = ../../config/wallpaper/p5precure_ruruka.jpg;

      xdg.portal = {
        enable = true;
        config.common.default = [ "gnome" ];
        extraPortals = with pkgs; [
          xdg-desktop-portal-gtk
          xdg-desktop-portal-gnome
        ];
      };
      programs.kitty = {
        enable = true;
        settings = {
          dynamic_background_opacity = true;

        };
      };

      home.packages = with pkgs; [
        xwayland-satellite
        gnome-keyring
        nautilus
        swaybg
        ueberzugpp
      ];

    };
}
