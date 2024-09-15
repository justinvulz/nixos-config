{pkgs, lib, ... }: 
{
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
    # colorschemes.gruvbox.enable = true;
    extraPlugins = [ pkgs.vimPlugins.gruvbox ];
    colorscheme = "gruvbox";
      plugins = {
				lightline.enable = true;
				bufferline.enable = true;
				treesitter.enable = true;
      };
  };
}
