{config, pkgs, ...} : 
{
  fileSystems."/home/justin/Ddisk" = {
    device = "/dev/disk/by-uuid/ee34615d-eb86-4d5c-92f4-9b99222c5245";
    fsType = "ext4";
    options = [
      "nofail"
    
    ];
  };

}
