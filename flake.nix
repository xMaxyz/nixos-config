{
  description = "NixOS Konfiguration mit 6.12 LTS-Kernel";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./configuration.nix
          ./boot.nix
          ./hardware-configuration.nix
        ];
      };
    };
  };
}