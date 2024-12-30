{config, pkgs, ... }: {

  programs.nixvim = {

    plugins.lsp = {
      
      enable = true;
      servers = {
        # C/C++
        clangd.enable = true;

        #nix
        nixd.enable = true;

        #typst
        tinymist = {
          enable = true;
          filetypes = [
            "typst"
          ];

          rootDir = "vim.fn.getcwd()";

          autostart = true;
          extraOptions = {
            offset_encoding = "utf-8";
          };
          
          # settings = {
          #   exportPdf = "onSave";
          #   outputPath = "$root/$name";
          # };
        };

        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
        };
        
      };


    };


  };



}
