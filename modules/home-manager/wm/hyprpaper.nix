{ config, lib, pkgs, ... }:
let p2w = x: "./../../../config/wallpaper/${x}";
in {

  services.hyprpaper = {
    enable = true;
    settings = {

      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      # IN stylix
      # 
      # preload = [
      #   (p2w "ave_mv_m.png")
      #   (p2w "snow.jpg")
      #   "./../../../config/wallpaper/ave_mv_m.png"

      # ];
      # wallpaper = [
      #   # ", ${p2w "snow.jpg"}"
      #   # ", ${p2w "ave_mv_m.png"}"
      #   ", ./../../../config/wallpaper/ave_mv_m.png"

      # ];

    };

  };

}
