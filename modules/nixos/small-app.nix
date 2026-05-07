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

}
