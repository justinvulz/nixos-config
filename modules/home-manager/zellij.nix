{ pkgs, lib, ... }: {

  programs.zellij = {
    enable = true;
    # enableZshIntegration = true;
    # attachExistingSession = true;
    # exitShellOnExit = true;
  };
  xdg.configFile."zellij/config.kdl".text = ''

    keybinds {
      normal {
        bind "Alt o" { FocusNextPane; }
      }
      pane {
        bind "Alt Tab" { FocusNextPane; }
      }

    }


  '';
}
