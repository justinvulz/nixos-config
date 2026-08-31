# overlay.nix 或 flake 的 overlays.default
final: prev: {
  taskwarrior3 = prev.taskwarrior3.overrideAttrs (old: rec {
    version = "3.5.0-unstable-2026-08-19";

    src = final.fetchFromGitHub {
      owner = "GothenburgBitFactory";
      repo = "taskwarrior";
      rev = "16136b22f84aa5764380a864cb6e42ef4c9f0353";
      hash = "sha256-nC7HCxFIGvoyQREKQG+lAcfXl7coAuywT4xe0kFrhiQ=";
      fetchSubmodules = true;
    };

    cargoDeps = final.rustPlatform.fetchCargoVendor {
      inherit src;
      hash = "sha256-hZEj22FP3nslrRlScoI6qiYD9HnGl1fqFE9T0uqesI8=";
    };
    patches = [ ];
    doInstallCheck = false;
  });
}
