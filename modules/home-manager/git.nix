{ pkgs, lib, ... }:

{
  programs.git = {
    enable = lib.mkDefault true;
    # userName = lib.mkDefault "justinChen";
    # userEmail = lib.mkDefault "justin.chen@thinktrace.com";
    signing.format = null;
    settings = {
      init.defaultBranch = "main";
      user = {
        name = lib.mkDefault "justinChen";
        email = lib.mkDefault "justin.chen@thinktrace.com";
      };
    };
  };
}
