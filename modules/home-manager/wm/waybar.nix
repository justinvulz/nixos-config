{
  wmModules.waybar =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      programs.waybar.enable = true;
      programs.waybar.style = ./../../../config/waybar/style.css;
      programs.waybar.settings = builtins.fromJSON (
        builtins.readFile ./../../../config/waybar/config.jsonc
      );
    };
}
