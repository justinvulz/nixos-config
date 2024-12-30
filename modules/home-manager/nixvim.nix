{pkgs, lib, ... }: 
{
  
  imports = [
    ./nixvim/lsp.nix
    ./nixvim/keymap.nix
  ];
  
  programs.nixvim = {

    enable = true;
    defaultEditor = true;
    
    opts = {
      number = true;
      relativenumber = true;
			shiftwidth = 2;
			softtabstop = 0;
			smarttab = true;
			expandtab = true;
      tabstop = 2;
    };

    # extraPlugins = with pkgs.vimPlugins;[ 
    #   # gruvbox 
    #   # vscode-nvim
    # ];

    # colorschemes.vscode.enable = lib.mkForce true;
    ## colorschemes.gruvbox.enable = lib.mkForce true;
    ## colorschemes.everforest.enable = true;
    ## colorschemes.poimandres.enable = true;   
    colorschemes.kanagawa.enable = true;
    colorschemes.kanagawa.settings.background.dark = "dragon";

    plugins = {
      
      web-devicons.enable = true;

			lightline.enable = true;

			bufferline.enable = true;

			treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
        };
      };
    
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
          ];

        };
      };    

      telescope.enable = true;

      rainbow-delimiters.enable = true;
    };


  };

}
