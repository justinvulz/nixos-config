{pkgs, lib, ... }: 

{
	programs.nixvim = {
		enable = true;
		opts = {
			number = true;
			relativenumber = true;
		};
		# colorschemes.gruvbox.enable = true;
		plugins.lightline.enable = true;
		extraPlugins = [ pkgs.vimPlugins.gruvbox ];
    colorscheme = "gruvbox";
	};
}