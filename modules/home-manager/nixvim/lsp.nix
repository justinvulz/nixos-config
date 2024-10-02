{config, pkgs, ... }: {

  programs.nixvim = {

    plugins.lsp = {
      
      enable = true;
      servers = {
        # C/C++
        clangd.enable = true;

        #typst
        typst-lsp = {
          enable = true;
          filetypes = [
            "typst"
          ];
          autostart = true;
          cmd = [
            "typst-lsp"
          ];
          settings = {
            exportPdf = "onSave";
          };
        };
      };


    };


  };



}
