{ lib, config, pkgs, ... }:

{
  imports = [
    ./../../modules/home-manager/git.nix
    ./../../modules/home-manager/zsh.nix
    # ./../../modules/home-manager/nixvim.nix
    ./../../modules/home-manager/hyprland.nix
    ./../../modules/home-manager/stylix.nix
    ./../../modules/home-manager/programming_language.nix
    ./../../modules/home-manager/helix.nix
    ./../../modules/home-manager/zellij.nix
    ./../../modules/home-manager/spicetify.nix
    ./../../modules/home-manager/obs.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "justin";
  home.homeDirectory = "/home/justin";
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    discord

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
    yazi # file manager
    zip
    unzip
    mpv # video player
    # cava #viluraize audio 
    # fzf #command-line fuzzy

    grim # screenshot
    slurp # screen area selection
    wl-clipboard # clipboard

    onlyoffice-bin

    s-tui
    stress

    # sonusmix
    qpwgraph

    # cloudflared

    prismlauncher # minecraft
    # ventoy

  ];

  programs.btop.enable = true;
  programs.btop.settings = lib.mkForce { color_theme = "Default"; };
  # services.spotifyd.enable = true;

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
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
