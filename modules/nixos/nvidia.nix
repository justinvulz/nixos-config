{pkgs, lib, config, ... } : {
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  hardware.opengl.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = lib.mkDefault false;
    powerManagement.finegrained = lib.mkDefault false;
    open = false;
    nvidiaSettings = true;
  };
  hardware.nvidia.prime = {
    offload.enable = true;
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };
}
