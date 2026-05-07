# lib/loader.nix
{ lib }:
{
  mkModuleTree =
    path:
    lib.pipe path [

      # 1. Read the directory contents
      builtins.readDir

      # 2. Filter for .nix files (excluding default.nix)
      (lib.filterAttrs (
        name: type:
        (type == "regular" || type == "symlink") && (lib.hasSuffix ".nix" name) && (name != "default.nix")
      ))

      # 3. Get just the filenames as a list
      builtins.attrNames

      # 4. Map over filenames to import them
      # Result: [ { mod1 = ...; } { mod2 = ...; mod3 = ...; } ]
      (map (name: import (path + "/${name}")))

      # 5. Merge all sets into one, handling potential duplicates
      (builtins.zipAttrsWith (
        name: values:
        if (builtins.length values) > 1 then
          builtins.throw "Duplicate module '${name}' found in ${path}"
        else
          builtins.head values
      ))
    ];
}
