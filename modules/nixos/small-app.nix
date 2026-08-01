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
}
