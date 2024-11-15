{config, pkgs, ...} : 
let 
  kmap = mode: key: action: 
  {
    inherit mode;
    inherit key;
    inherit action;
    options.silent = true;
  };

in 
{

 
  programs.nixvim = {
    globals.mapleader = ",";
    keymaps = [
      
      # horizontally vertically split windows
      (kmap "n" "sv" ":vs<CR>")
      (kmap "n" "sh" ":sp<CR>")
      #close windows
      (kmap "n" "sc" "<C-w>c")

      # move in winsows
      (kmap "n" "<A-h>" "<C-w>h")
      (kmap "n" "<A-j>" "<C-w>j")
      (kmap "n" "<A-l>" "<C-w>l")
      (kmap "n" "<A-h>" "<C-w>h")
      
      # map d and c to block hole 
      (kmap "n" "d" "\"_d")
      (kmap "n" "c" "\"_c")


      # telescop 
      (kmap "n" "<leader>ff" ":Telescope find_files<cr>")
      (kmap "n" "<leader>fg" ":Telescope live_grep<cr>")
      (kmap "n" "<leader>fb" ":Telescope buffers<cr>")

      # move
    ];
  };
  


}
