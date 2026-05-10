# lib/loader.nix
{ lib }:
let
  # Helper to process a single directory
  cleanFile =
    path: name: type:
    let
      fullPath = path + "/${name}";
      isNixFile =
        (type == "regular" || type == "symlink") && lib.hasSuffix ".nix" name && name != "default.nix";
      isDir = type == "directory";
      # Clean name (remove .nix)
      cleanName = lib.removeSuffix ".nix" name;
    in
    if isDir then
      lib.nameValuePair (cleanName + "_dir") (processDir fullPath)
    else if isNixFile then
      lib.nameValuePair (cleanName + "_file") (import fullPath)
    else
      lib.nameValuePair "__ignore__" null;

  strictRecursiveUpdate =
    lhs: rhs:
    lib.zipAttrsWith
      (
        name: values:
        let
          # Values will always be a list of 1 or 2 elements
          # (one from lhs, one from rhs)
          first = builtins.elemAt values 0;
          second = builtins.elemAt values 1;
        in
        if builtins.length values == 1 then
          first
        else if builtins.isAttrs first && builtins.isAttrs second then
          # If both are sets, recurse deeper
          strictRecursiveUpdate first second
        else
          # Collision detected at a non-set value
          throw
            "Conflict detected in strictRecursiveUpdate: attribute '${name}' is defined in both sets and cannot be merged without overriding."
      )
      [
        lhs
        rhs
      ];

  processDir =
    path:
    path
    |> builtins.readDir # { file_name = type}
    |> lib.mapAttrs' (cleanFile path) # { cleanName = { ModuleNmae ={} }  }
    |> lib.filterAttrs (n: v: n != "__ignore__" && v != { })
    |> builtins.attrValues # [ {ModuleName = {}}, func ]
    |> lib.filter builtins.isAttrs # [ {ModuleName = {}} ]
    |> lib.foldl' strictRecursiveUpdate { };

in
{
  mkModuleTree = processDir;
}
