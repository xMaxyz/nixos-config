{
  description = "NixOS Flake Config";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    niri.url = "github:sodiboo/niri-flake";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ 
          ./modules/configuration.nix 
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.max = import ./home/home.nix;
            home-manager.sharedModules = [
              inputs.niri.homeModules.niri
            ];
          }
        ];
      };
    };
  };
}
