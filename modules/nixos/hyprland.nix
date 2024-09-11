{inputs, pkgs, ...}: {

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };
  # environment.systemPackages = with pkgs; [
  #   kitty
  # ];
  boot.kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocation=1" ];
  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.open = false;
}

