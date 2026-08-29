{
  description = "NixOS Flake Config";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    niri.url = "github:epireyn/niri-flake";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs: 
  let
    overlayModule = {
      nixpkgs.overlays = [
        (final: prev: {
          unstable = import nixpkgs-unstable {
            system = prev.stdenv.hostPlatform.system;
            config.allowUnfree = true;
          };
        })
      ];
    };

    homeManagerConfigModule = host: {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = { inherit inputs host; };
      
      home-manager.users.max = import ./home/max.nix;
      
      home-manager.sharedModules = [
        ./modules/core/attrset.nix
        inputs.niri.homeModules.niri
      ];
    };

    mkHost = host: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs host; };
      modules = [
        ./hosts/${host}/configuration.nix
        overlayModule
        home-manager.nixosModules.home-manager
        (homeManagerConfigModule host) 
      ];
    };
  
  in {
    nixosConfigurations = {
      nixie = mkHost "nixie";
      maggie = mkHost "maggie";
    };
  };
}
