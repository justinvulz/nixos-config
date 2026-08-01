{
  hyprland-cache =
    { inputs, pkgs, ... }:
    {

      nix.settings = {
        substituters = [
          "https://hyprland.cachix.org"
        ];
        trusted-public-keys = [
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        ];

      };
    };
  tola-cache = {

    nix.settings = {
      substituters = [ "https://tola.cachix.org" ];
      trusted-public-keys = [ "tola.cachix.org-1:5hMwVpNfWcOlq0MyYuU9QOoNr6bRcRzXBMt/Ua2NbgA=" ];
    };

  };
}
