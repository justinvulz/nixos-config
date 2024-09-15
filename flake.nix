{
  description = "First test flake";

  inputs ={
    nixpkgs.url = "nixpkgs/nixos-24.05";

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
    #   url = "github:hyprwm/hyprland-plugins";
    #   inputs.hyprland.follows = "hyprland";
    # };

    pyprland.url = "github:hyprland-community/pyprland";

    # split-monitor-workspaces = {
    #   url = "github:Duckonaut/split-monitor-workspaces";
    #   inputs.hyprland.follows = "hyprland";
    # };

    hyprswitch.url = "github:h3rmt/hyprswitch/release";
  };

  outputs = {self, nixpkgs, home-manager,hyprland, ...}@inputs: 
  let
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };
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
    };
    homeConfigurations = {
      justin = home-manager.lib.homeManagerConfiguration {
        inherit pkgs; 
	extraSpecialArgs = {inherit inputs;};
        modules = [ 
          inputs.stylix.homeManagerModules.stylix 
          inputs.nixvim.homeManagerModules.nixvim
         #hyprland.homeManagerModules.default
	 # {
	 #   wayland.windowManager.hyprland.enable = true;
	 #   wayland.windowManager.hyprland.plugins = [
	 #     inputs.hyprland-plugins.packages."${pkgs.stdenv.hostPlatform.system}".borders-plus-plus
	 #   ];
	 # }
          ./hosts/default/home.nix 
        ];
      };
    };
  };

}

