{ pkgs, lib, ... }: {

  programs.zellij.enable = true;
  programs.zellij.enableZshIntegration = true;
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
