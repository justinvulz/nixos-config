{pkgs, lib, ... }: 
{
  
  imports = [
    ./nixvim/lsp.nix
  ];
  programs.nixvim = {

    enable = true;

    opts = {
      number = true;
      relativenumber = true;
			shiftwidth = 2;
			softtabstop = 0;
			smarttab = true;
			expandtab = true;
      tabstop = 2;
    };

    extraPlugins = with pkgs;[ 
      vimPlugins.gruvbox 
    ];

    colorscheme = "gruvbox";

    plugins = {
			lightline.enable = true;
			bufferline.enable = true;
			treesitter.enable = true;
      cmp = {
        enable = true;
        autoEnableSources = true;
      };    
      telescope.enable = true;
    };

  };

}
