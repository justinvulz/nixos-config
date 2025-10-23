{ config, pkgs, ... }: {
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      X11Forwarding = true;
    };

  };
  # networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 5000 5001 ];

}
