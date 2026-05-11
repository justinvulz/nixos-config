{
  essential =
    { pkgs, ... }:
    {
      # Bootloader.
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      boot.supportedFilesystems = [
        "ntfs"
        # "zfs"
        # "apfs"
      ];

      networking.networkmanager.enable = true;
      networking.firewall.enable = true;

      # Enable networking
      hardware.bluetooth = {
        enable = true;
        powerOnBoot = true;
        input = {
          General = {
            UserspaceHID = true;
          };
        };
      };
      services.blueman.enable = true;
      time.timeZone = "Asia/Taipei";

      # CPU thermald Bootting
      services.thermald.enable = true;
      powerManagement.cpuFreqGovernor = "performance";

      # i18n
      i18n.defaultLocale = "en_US.UTF-8";

      i18n.extraLocaleSettings = {
        LC_ADDRESS = "zh_TW.UTF-8";
        LC_IDENTIFICATION = "zh_TW.UTF-8";
        LC_MEASUREMENT = "zh_TW.UTF-8";
        LC_MONETARY = "zh_TW.UTF-8";
        LC_NAME = "zh_TW.UTF-8";
        LC_NUMERIC = "zh_TW.UTF-8";
        LC_PAPER = "zh_TW.UTF-8";
        LC_TELEPHONE = "zh_TW.UTF-8";
        LC_TIME = "zh_TW.UTF-8";
      };

      i18n.inputMethod = {
        type = "fcitx5";
        enable = true;
        fcitx5.waylandFrontend = true;
        fcitx5.addons = with pkgs; [
          rime-data
          fcitx5-rime
          fcitx5-gtk
          fcitx5-nord
        ];
      };

      # Configure keymap in X11
      services.xserver.xkb = {
        layout = "us";
        variant = "";
      };
      services.xserver.enable = true;
      # Enable polkit for allowing unprivileged users to run administrative tasks.
      security.polkit.enable = true;

      # Enable CUPS to print documents.
      services.printing.enable = true;

      # Enable sound with pipewire.
      services.pulseaudio.enable = false;
      security.rtkit.enable = true;
      services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        jack.enable = true;

        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        #media-session.enable = true;
      };

      # Enable touchpad support (enabled default in most desktopManager).
      services.libinput.enable = true;

      # uninstall the nixos documentation
      documentation.nixos.enable = false;

      users.defaultUserShell = pkgs.nushell;

      # Allow unfree packages
      nixpkgs.config.allowUnfree = true;

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];

      # auto delete old generations
      nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 7d";
      };
      nix.optimise.automatic = true;

    };
}
