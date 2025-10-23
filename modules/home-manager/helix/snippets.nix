{ pkgs, lib, ... }:
let
  snippets_unicode = {
    # forall = "";
    imply = "→";
    alpha = "α";
    betta = "β";
    gamma = "γ";
    forall = "∀";
  };
  tomlFile = (pkgs.formats.toml { }).generate "base.toml" snippets_unicode;
in {
  home.file.".config/helix/unicode-input/base.toml".source = tomlFile;

}
