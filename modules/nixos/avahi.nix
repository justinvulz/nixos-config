{ config, pkgs, lib, inputs, ... }:

{

  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true; # Optional: allows mDNS through firewall
    publish = {
      enable = true;
      addresses = true;
      domain = true;
      userServices = true;
      workstation = true;
    };
  };
  # services.avahi.enable = true;
  # services.avahi.publish.enable = true;
}
