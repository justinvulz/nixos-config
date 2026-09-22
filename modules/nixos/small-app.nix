{
  htop =
    { lib, ... }:
    {
      programs.htop = {
        enable = lib.mkDefault true;
      };

    };

  i2p =
    { config, pkgs, ... }:
    {
      services.i2p.enable = true;

    };

  ratbagd =
    { pkgs, ... }:
    {
      services.ratbagd.enable = true;
    };

  cloudflare =
    { pkgs, ... }:
    {
      services.cloudflare-warp.enable = true;
    };

  rustdesk = {
    services.rustdesk-server = {
      enable = true;
      openFirewall = true;
    };
  };
  nix-ld = {
    programs.nix-ld.enable = true;
  };
  keychron-patch = {
    services.udev.extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", ATTRS{idProduct}=="0440", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
    '';

  };
}
