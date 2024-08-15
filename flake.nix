{
  description = "First test flake";

  inputs ={
    nixpkgs.url = "nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
  };

  outputs = {self, nixpkgs, home-manager, ...}@inputs: 
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosConfigurations = {
      justin-nixos = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/default/configuration.nix ];
      };
    };
    homeConfigurations = {
      justin = home-manager.lib.homeManagerConfiguration {
        inherit pkgs; 
        modules = [ inputs.stylix.homeManagerModules.stylix ./hosts/default/home.nix ];
      };
    };
  };

}

