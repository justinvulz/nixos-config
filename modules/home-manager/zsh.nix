{pkgs, lib, config, ... }: 

{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        shellAliases = {
            ll = "ls -l";
        };
        history = {
            size = 100;
            path = "${config.xdg.dataHome}/zsh/history";
        };
    };
}