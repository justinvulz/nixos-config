{
  description = "First test flake";

  inputs ={
    nixpkgs.url = "nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";

    # nixos-cosmic = {
    #   url = "github:lilyinstarlight/nixos-cosmic";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    # hyprland-plugins = {
    #   url = "github:hyprwm/hyprland-plugins"; inputs.hyprland.follows = "hyprland";
    # };

    pyprland.url = "github:hyprland-community/pyprland";

    # split-monitor-workspaces = {
    #   url = "github:Duckonaut/split-monitor-workspaces";
    #   inputs.hyprland.follows = "hyprland";
    # };

    hyprswitch.url = "github:h3rmt/hyprswitch/release";

    nbfc-linux = {
      url = "github:nbfc-linux/nbfc-linux";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, nixpkgs-unstable, home-manager,hyprland, ...}@inputs: 
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
    pkgs-unstable = import nixpkgs-unstable {inherit system; config.allowUnfree = true;};
  in {
    nixosConfigurations = {
      justin-nixos = lib.nixosSystem {
        system = "x86_64-linux";
	      specialArgs = {inherit inputs; };
        modules = [ 
        #   {
        #     nix.settings = {
        #       substituters = [ "https://cosmic.cachix.org/" ];
        #       trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
        #     };
        #   }
        #   nixos-cosmic.nixosModules.default
	  
          ./hosts/default/configuration.nix 
        ];
      };
      justin-msi = lib.nixosSystem {
        system = "x86_64-linux";
	      specialArgs = {inherit inputs; };
        modules = [ 
          ./hosts/msilaptop/configuration.nix 
        ];
      };
    };
    homeConfigurations = {
      justin = home-manager.lib.homeManagerConfiguration {
        inherit pkgs; 
	      extraSpecialArgs = {
          inherit inputs;
          inherit pkgs-unstable;
        };
        modules = [ 
          inputs.stylix.homeManagerModules.stylix 
          inputs.nixvim.homeManagerModules.nixvim
          ./hosts/user/home.nix 
        ];
      };
    };
  };

}

