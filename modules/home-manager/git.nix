{pkgs, lib, ... }: 

{
  programs.git = {
    enable = lib.mkDefault true;
    userName = lib.mkDefault "justinChen";
    userEmail = lib.mkDefault "justin.chen@thinktrace.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}