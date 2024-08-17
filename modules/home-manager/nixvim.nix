{pkgs, lib, ... }: 

{
	programs.nixvim = {
		enable = true;
		opts = {
			number = true;
			relativenumber = true;
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