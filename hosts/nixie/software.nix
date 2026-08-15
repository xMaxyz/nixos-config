{ pkgs, ... }:

{
  #extra program modules for this system
  imports = [
    ../../modules/programs/lmms.nix
  ];
  
  environment.systemPackages = with pkgs; [
    
    (prismlauncher.override { #übergibt Java an prism
      jdks = [ graalvmPackages.graalvm-ce zulu8 zulu17 zulu ];
    })

  ];

  programs = {};
}