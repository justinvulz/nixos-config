{ pkgs, lib, ... }:
{

  programs.zellij = {
    enable = true;
    settings = {
      theme = "nord";
    };

    extraConfig = ''
      keybinds {
        normal {
          bind "Alt o" { FocusNextPane; }
        }
        pane {
          bind "Alt Tab" { FocusNextPane; }
        }
      }
    '';
    # enableZshIntegration = true;
    # attachExistingSession = true;
    # exitShellOnExit = true;
  };
  # xdg.configFile."zellij/config.kdl".text = ''

  # '';
}
