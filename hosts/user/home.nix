{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.zen-browser.homeModules.beta
    inputs.stylix.homeModules.stylix
    inputs.spicetify-nix.homeManagerModules.default

  ]
  ++ (with inputs.self.homeModules; [
    git
    niri
    programming-language
    helix
    zellij
    spicetify
    obs
    nushell
    zed
    zen-browser
    yazi
    btop
    stylix
    xdg
  ]);

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  gtk.gtk4.theme = null;
  home.username = "justin";
  home.homeDirectory = "/home/justin";

  home.packages = with pkgs; [

    # pciutils
    # tuxguitar
    audacity
    discord
    nethack
    # octaveFull # matlab opensource alt
    # ncspot # spotify
    # spotify
    # system tool
    lshw
    lm_sensors
    nvtopPackages.full
    parted # disk part
    # gpu-burn

    kdePackages.okular # pdf reader
    # cinnamon.nemo #file browser
    # yazi # file manager
    zip
    unzip
    mpv # video player
    # cava #viluraize audio
    # fzf #command-line fuzzy

    grim # screenshot
    slurp # screen area selection
    wl-clipboard # clipboard

    # onlyoffice-bin
    libreoffice-qt6-fresh
    # s-tui
    feh
    # imv

    # sonusmix
    # qpwgraph
    coppwr
    # cloudflared
    pitivi # vedio editor
    prismlauncher # minecraft
    # element-desktop
    # element-web
    # lunar-client
    # ventoy
    # uxplay
    # avahi
    # vdhcoapp
  ];
  programs.home-manager.enable = true;
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
}
