{ pkgs, lib, ... }: {

  home.packages = with pkgs; [
    # lsp
    nil
    # clang
    # clang-tools
    bear
    tinymist
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
        # # introduce new language server
        # [language-server.scls]
        # command = "simple-completion-language-server"

        # [language-server.scls.config]
        # max_completion_items = 100           # set max completion results len for each group: words, snippets, unicode-input
        # feature_words = true                 # enable completion by word
        # feature_snippets = true              # enable snippets
        # snippets_first = true                # completions will return before snippets by default
        # snippets_inline_by_word_tail = false # suggest snippets by WORD tail, for example text `xsq|` become `x^2|` when snippet `sq` has body `^2`
        # feature_unicode_input = false        # enable "unicode input"
        # feature_paths = false                # enable path completion
        # feature_citations = false            # enable citation completion (only on `citation` feature enabled)

        # # write logs to /tmp/completion.log
        # [language-server.scls.environment]
        # RUST_LOG = "info,simple-completion-language-server=info"
        # LOG_FILE = "/tmp/completion.log"
      ];
    };

    themes = {
      autumn_night_self = {
        "inherits" = "autumn";
        "variable" = "#c56e46";
        "constant" = "#f29b5c";

      };

    };

  };

}
