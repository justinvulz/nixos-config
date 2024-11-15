#!/bin/bash

nix-shell -p git --command "git clone git@github.com:justinvulz/nixos-config.git"

# nix.settings.experimental-features = [ "nix-command" "flakes" ];
# nixos-rebuild swith .
# nisos-rebuild swith --flake .#justin-msi
