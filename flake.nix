{
  description = "First test flake";

  inputs = {
    # nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    #nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.inputs.base16.follows = "base16";
    base16.url = "github:Noodlez1232/base16.nix/slugify-fix";
    stylix.url = "github:danth/stylix";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    spicetify-nix.inputs.nixpkgs.follows = "nixpkgs";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland";

    # hyprland-plugins = {
    #   url = "github:hyprwm/hyprland-plugins"; inputs.hyprland.follows = "hyprland";
    # };

    pyprland.url = "github:hyprland-community/pyprland";

    # split-monitor-workspaces = {
    #   url = "github:Duckonaut/split-monitor-workspaces";
    #   inputs.hyprland.follows = "hyprland";
    # };

    hyprswitch.url = "github:h3rmt/hyprswitch/release";

    # nbfc-linux = {
    #   url = "github:nbfc-linux/nbfc-linux";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      # pkgs-unstable = import nixpkgs-unstable {inherit system; config.allowUnfree = true;};
    in {
      nixosConfigurations = {

        justin-nixos = lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [ ./hosts/default/configuration.nix ];
        };

        justin-msi = lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [ ./hosts/msilaptop/configuration.nix ];
        };

      };
      homeConfigurations = {
        justin = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [
            inputs.stylix.homeManagerModules.stylix
            inputs.spicetify-nix.homeManagerModules.default
            ./hosts/user/home.nix
          ];
        };
      };
    };

}

