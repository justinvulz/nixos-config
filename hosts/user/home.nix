{
  lib,
  pkgs,
  inputs,
  ...
}:
let
  mapImport = moduleBase: pathList: map (name: moduleBase + "/${name}.nix") pathList;
  hmModules = mapImport ./../../modules/home-manager [
    "git"
    "niri"
    "programming_language"
    "helix"
    "zellij"
    "spicetify"
    "obs"
    "nushell"
    "zed"
    "zen-browser"
    "yazi"
    "btop"
    "stylix"
  ];

in
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ]
  ++ hmModules;
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

  xdg.enable = true;
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = [ "okularApplication_pdf.desktop" ];
      "x-scheme-handler/http" = [ "zen-beta.desktop" ];
      "x-scheme-handler/https" = [ "zen-beta.desktop" ];
      "x-scheme-handler/chrome" = [ "zen-beta.desktop" ];
      "text/html" = [ "zen-beta.desktop" ];
      "application/x-extension-htm" = [ "zen-beta.desktop" ];
      "application/x-extension-html" = [ "zen-beta.desktop" ];
      "application/x-extension-shtml" = [ "zen-beta.desktop" ];
      "application/xhtml+xml" = [ "zen-beta.desktop" ];
      "application/x-extension-xhtml" = [ "zen-beta.desktop" ];
      "application/x-extension-xht" = [ "zen-beta.desktop" ];

    };
    associations.added = {
      "application/pdf" = [ "okularApplication_pdf.desktop" ];
      "x-scheme-handler/http" = [ "zen-beta.desktop" ];
      "x-scheme-handler/https" = [ "zen-beta.desktop" ];
      "x-scheme-handler/chrome" = [ "zen-beta.desktop" ];
      "text/html" = [ "zen-beta.desktop" ];
      "application/x-extension-htm" = [ "zen-beta.desktop" ];
      "application/x-extension-html" = [ "zen-beta.desktop" ];
      "application/x-extension-shtml" = [ "zen-beta.desktop" ];
      "application/xhtml+xml" = [ "zen-beta.desktop" ];
      "application/x-extension-xhtml" = [ "zen-beta.desktop" ];
      "application/x-extension-xht" = [ "zen-beta.desktop" ];
    };

  };
  #
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';

  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/justin/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "hx";
  };

  # Let Home Manager install and manage itself.
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
