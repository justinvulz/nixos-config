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

  mergeModule = (
    path: name: values:
    if (builtins.length values) > 1 then
      builtins.throw "Duplicate module '${name}' found in ${path}"
    else
      builtins.head values
  );

  processDir =
    path:
    path
    |> builtins.readDir # { file_name = type}
    |> lib.mapAttrs' (cleanFile path) # { cleanName = { ModuleNmae ={} }  }
    |> lib.filterAttrs (n: v: n != "__ignore__" && v != { })
    |> builtins.attrValues # [ {ModuleName = {}}, func ]
    |> lib.filter builtins.isAttrs # [ {ModuleName = {}} ]
    |> builtins.zipAttrsWith (mergeModule path);

in
{
  mkModuleTree = processDir;
}
