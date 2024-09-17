{config, pkgs, ... }: {

  programs.nixvim = {

    plugins.lsp = {
      
      enable = true;
      servers = {
        # C/C++
        clangd.enable = true;

        #typst
        typst-lsp.enable = true;
      };


    };


  };



}
