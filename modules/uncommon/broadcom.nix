{ config, pkgs, lib, inputs, ... }:

{
  boot = {
    extraModulePackages = [ 
      config.boot.kernelPackages.broadcom_sta 
    ];

    blacklistedKernelModules = [ 
      "b43" 
      "bcma" 
      "ssb" 
      "brcmfmac" 
      "brcmsmac" 
    ];
  };
  
  nixpkgs.config.allowInsecurePredicate = pkg: builtins.elem (lib.getName pkg) [
    "broadcom-sta"
  ]; 
}