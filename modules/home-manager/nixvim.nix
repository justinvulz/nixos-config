{pkgs, lib, ... }: 
{
  
  imports = [
    ./nixvim/lsp.nix
    ./nixvim/keymap.nix
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

    extraPlugins = with pkgs.vimPlugins;[ 
      gruvbox 
      vscode-nvim
    ];

    colorscheme = "vscode";

    plugins = {
			lightline.enable = true;

			bufferline.enable = true;

			treesitter.enable = true;

      cmp = {
        enable = true;
        autoEnableSources = true;
      };    

      telescope.enable = true;

      rainbow-delimiters.enable = true;
    };

  };

}
