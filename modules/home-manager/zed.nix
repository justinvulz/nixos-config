{ pkgs, lib, ... }:
{

  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
    ];
    userSettings = {
      helix_mode = true;
      disable_ai = true;
      collaboration_panel = {
        button = false;
      };
      chat_panel = {
        button = false;
      };
      title_bar = {
        show_sign_in = false;

      };
    };
  };
}
