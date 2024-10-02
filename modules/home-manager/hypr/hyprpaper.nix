{config, lib, pkgs, ...} : 
let 
  p2w = x : "./../../../config/${x}";
in 
{
  
  services.hyprpaper = {
    enable = true;
    settings = {
      
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [
        (p2w "snow.jpg")
      ];
      wallpaper = [
        ", ${p2w "snow.jpg"}"
      ];


    };

  };
  

}  
