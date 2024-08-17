{pkgs, lib, ... }: 

{
	programs.nixvim = {
		enable = true;
		options = {
			number = true;
			relativenumber = true;
			
		};
		colorschemes.gruvbox.enable = true;
		plugins.lightline.enable = true;
	};
}