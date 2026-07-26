{
  description = "NixOS Flake Config";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    niri.url = "github:sodiboo/niri-flake/pull/1731/head";
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

    homeManagerConfigModule = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = { inherit inputs; };
      home-manager.users.max = import ./home/home.nix;
      home-manager.sharedModules = [
        inputs.niri.homeModules.niri
      ];
    };

    mkHost = host: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/${host}/configuration.nix
        overlayModule
        home-manager.nixosModules.home-manager
        homeManagerConfigModule
      ];
    };
  
  in {
    nixosConfigurations = {
      nixie = mkHost "nixie";
      maggie = mkHost "maggie";
    };
  };
}
