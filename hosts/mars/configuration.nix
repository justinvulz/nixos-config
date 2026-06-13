{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./spmodule/nvidia.nix
  ]
  ++ (with inputs.self.nixosModules; [
    essential
    niri
    htop
    steam
    ssh
    docker
    fonts
    ratbagd
    nbfc
  ]);

  # Bootloader.

  networking.hostName = "mars"; # Define your hostname.
  networking.hostId = "37abf3e1";

  # fIX MSI FAN ?!!!!
  boot.kernelModules = [ "ec_sys" ];
  boot.kernelParams = [ "ec_sys.write_support=1" ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.justin = {
    isNormalUser = true;
    description = "justin";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    home-manager
    fastfetch
  ];

  #mount HDD
  fileSystems."/home/justin/DATA_HDD" = {
    device = "/dev/disk/by-uuid/696f17f3-debe-48ac-bee8-e9436a45d789";
    fsType = "ext4";
    options = [
      "nofail"
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
