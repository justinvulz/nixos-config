{ lib }:
{
  makeModuleSet =
    moduleBase:
    let
      files = builtins.readDir moduleBase;
    in
    lib.pipe files [
      (lib.filterAttrs (
        name: type:
        (type == "regular" || type == "symlink") && (lib.hasSuffix ".nix" name) && (name != "default.nix")
      ))
      (lib.mapAttrs' (
        name: value: {
          name = lib.removeSuffix ".nix" name;
          value = moduleBase + "/${name}";
        }
      ))
    ];
}
