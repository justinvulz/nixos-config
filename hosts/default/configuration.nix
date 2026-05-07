{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
  ]
  ++ (with inputs.self.nixosModules; [
    essential

    amddriver
    niri
    htop
    steam
    ssh
    docker
    cache
    i2p
    fonts
    ratbagd
  ]);

  networking.hostName = "nixos"; # Define your hostname.
  networking.hostId = "bccd08f1";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.justin = {
    isNormalUser = true;
    description = "justin";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  environment.systemPackages = with pkgs; [
    piper
    usbutils
    vim
    wget
    git
    home-manager
    fastfetch
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
