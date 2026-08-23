{ pkgs, ... }:

{
  #extra program modules for this system
  imports = [
    ../../modules/services/pipewire.nix
    ../../modules/services/alt-win-switch.nix
    
    ../../modules/programs/pass.nix
    ../../modules/programs/lmms.nix
    ../../modules/programs/vesktop.nix
  ];
  
  environment.systemPackages = with pkgs; [
    
    (prismlauncher.override { #übergibt Java an prism
      jdks = [ graalvmPackages.graalvm-ce zulu8 zulu17 zulu ];
    })

  ];

  programs = {};
}