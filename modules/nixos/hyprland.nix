{ inputs, pkgs, ... }: {

  programs.hyprland = {
    enable = true;
    package =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.default;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command =
          "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%I:%M %p | %a • %h | %F' --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  environment.systemPackages = with pkgs;
    [
      greetd.tuigreet

      #   inputs.hyprswitch.packages.x86_64-linux.default
    ];

  # nix.settings = {
  #   substituters = [ "https://hyprland.cachix.org" ];
  #   trusted-public-keys =
  #     [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  # };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  boot.kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocation=1" ];
  hardware.nvidia.powerManagement.enable = true;
  hardware.nvidia.open = false;
}

