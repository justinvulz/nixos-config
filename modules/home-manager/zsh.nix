{pkgs, lib, config, ... }: 

{
  home.packages = with pkgs; [
    zsh-powerlevel10k
  ];
  
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
      cls = "clear";
      y = "yazi";
    };
    history = {
      size = 100;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "copypath"];
    };
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./../../config/p10k-config;
        file = ".p10k.zsh";
      }
    ];
  };
}
