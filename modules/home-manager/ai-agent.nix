{
  opencode =
    { pkgs, lib, ... }:
    {
      programs.opencode = {
        enable = true;
        tui = {
          keybinds = {
            command_list = "ctrl+i";
          };
        };
      };
    };
  claude-code =
    { pkgs, lib, ... }:
    {
      home.packages = with pkgs; [ claude-code ];

    };
  gemini-cli =
    { pkgs, lib, ... }:
    {

      home.packages = with pkgs; [ antigravity-cli ];

    };
}
