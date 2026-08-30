{
  description = "NixOS Flake Config";
  
  #all inputs used for this flake
  inputs = {
    #input for stable system foundation.
    #should be used for system-wide core packages.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    
    #input for bleeding-edge user programs.
    #should NOT be used for system-wide core programs.
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    
    #input for the epireyn/niri-flake. 
    #may be changed to any other drop-in-replacement niri-flake version
    niri.url = "github:epireyn/niri-flake";
    
    #input for nix-flatpak
    #neccessary so we can declare flatpaks rather than installing them imperatively
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    
    #home-manager input for the system's very state version.
    #let's NOT change this at any time to maintain stability ^^ 
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs: 
  let
    #sets an overlay to create a pkgs.unstable
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

    #home-manager configuratio
    homeManagerConfigModule = host: {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.extraSpecialArgs = { inherit inputs host; };
      
      #make sure every user gets their own home config
      home-manager.users.max = import ./home/max.nix;
      
      #modules every user shall get
      home-manager.sharedModules = [
        ./modules/core/attrset.nix #structure for my.host
        inputs.niri.homeModules.niri #niri-flake
        nix-flatpak.homeManagerModules.nix-flatpak #flatpak
      ];
    };

    #creates the nixosSystem
    mkHost = host: nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs host; };
      modules = [
        ./hosts/${host}/configuration.nix #host-wide config access point
        overlayModule #the pkgs.unstable overlay from above
        home-manager.nixosModules.home-manager #the home-manager module
        (homeManagerConfigModule host) #home-manager settings for specific host from above
      ];
    };
  
  in {
    #list of all hosts that shall be created
    nixosConfigurations = {
      nixie = mkHost "nixie";
      maggie = mkHost "maggie";
    };
  };
}
