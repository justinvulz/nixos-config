{ pkgs, lib, ... }:
{

  imports = [ ./helix/snippets.nix ];
  home.packages = with pkgs; [
    # lsp
    nil # nix
    # clang
    # clang-tools
    # bear
    tinymist # typst
    gcc
    simple-completion-language-server
  ];

  programs.helix = {
    enable = true;

    defaultEditor = true;

    settings = {
      # theme = "gruvbox_dark_hard";
      # theme = "varua";
      theme = "autumn_night_self";
      # theme = "autumn_night";
      # theme = "catppuccin_mocha";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };

      editor = {
        inline-diagnostics.cursor-line = "warning";
        end-of-line-diagnostics = "hint";
        line-number = "relative";
        true-color = true;

      };

      keys.normal = {
        X = [
          "extend_line_up"
          "extend_to_line_bounds"
        ];
        A-x = "extend_to_line_bounds";
      };
      keys.select = {
        X = [
          "extend_line_up"
          "extend_to_line_bounds"
        ];
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
        { name = "cpp"; }
        {
          name = "lean";
          language-servers = [
            "scls"
            "lean"
          ];
        }
        {
          name = "python";
          indent = {
            tab-width = 2;
            unit = " ";
          };
        }
        {
          name = "json";
          indent = {
            tab-width = 4;
            unit = " ";
          };
        }
      ];
      language-server = {
        lean = {
          command = "lean";
          args = [ "--server" ];
        };
        scls = {
          command = "simple-completion-language-server";
          config = {
            max_completion_items = 100;
            feature_words = true;
            feature_snippets = true;
            snippets_first = true;
            snippets_inline_by_word_tail = false;
            feature_unicode_input = true;
            feature_paths = false;
            feature_citations = false;

          };
        };

      };
    };

    themes = {
      autumn_night_self = {
        "inherits" = "autumn";
        "variable" = "#c56e46";
        "constant" = "#f29b5c";
        "ui.cursor.primary" = {
          fg = "#2d3640";
          bg = "white";
        };

      };

    };

  };

}
