{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;

      enabledExtensions = with spicePkgs.extensions; [
        hidePodcasts
        shuffle # shuffle+ (special characters are sanitized out of extension names)
        fullAppDisplay

      ];
      # enabledCustomApps = with spicePkgs.apps; [ marketplace ];
      enabledSnippets = with spicePkgs.snippets; [
        rotatingCoverart
        pointer
      ];

      # theme = spicePkgs.themes.catppuccin;
      # colorScheme = "mocha";
    };
}
