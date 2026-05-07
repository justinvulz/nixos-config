{
  btop =
    { lib, ... }:
    {
      programs.btop.enable = true;
      programs.btop.settings = lib.mkForce { color_theme = "Default"; };
    };

  yazi = {
    programs.yazi = {
      enable = true;
      enableNushellIntegration = true;
      shellWrapperName = "y";
    };
  };

  zen-browser = {
    programs.zen-browser.enable = true;
  };

  programming-language =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        #gnat14
        typst
        lean4
        #rustc
        #cargo
      ];

    };

  obs =
    { pkgs, ... }:
    {
      programs.obs-studio = {
        enable = true;
        plugins = with pkgs.obs-studio-plugins; [
          wlrobs
          obs-backgroundremoval
          obs-pipewire-audio-capture
        ];
      };
    };

  git =
    { lib, ... }:

    {
      programs.git = {
        enable = lib.mkDefault true;
        # userName = lib.mkDefault "justinChen";
        # userEmail = lib.mkDefault "justin.chen@thinktrace.com";
        signing.format = null;
        settings = {
          init.defaultBranch = "main";
          user = {
            name = lib.mkDefault "justinChen";
            email = lib.mkDefault "justin.chen@thinktrace.com";
          };
        };
      };
    };
}
