{config, pkgs, ... }: {

  programs.nixvim = {

    plugins.lsp = {
      
      enable = true;
      servers = {
       # C/C++
       clangd.enable = true;

      };


    };


  };



}
