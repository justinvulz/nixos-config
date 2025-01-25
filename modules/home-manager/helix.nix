{ pkgs, lib, ... }: {

  home.packages = with pkgs; [
    # lsp
    nil
    # clang
    # clang-tools
    bear
  ];

  programs.helix = {
    enable = true;

    defaultEditor = true;

    settings = {
      theme = "autumn_night_transparent";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };

      editor = {
        inline-diagnostics.cursor-line = "warning";
        end-of-line-diagnostics = "hint";
        line-number = "relative";
      };

      keys.normal = {
        X = [ "extend_line_up" "extend_to_line_bounds" ];
        A-x = "extend_to_line_bounds";
      };
      keys.select = {
        X = [ "extend_line_up" "extend_to_line_bounds" ];
        A-x = "extend_to_line_bounds";
      };
    };

    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
        }

        {
          name = "html";
          auto-format = false;
        }
      ];
    };

    themes = {
      autumn_night_transparent = {
        "inherits" = "autumn_night";
        "ui.background" = { };
      };
    };

  };

}
