{ config, pkgs, lib, inputs, ... }:

{
  boot = {
    kernelModules = [ 
      "kvm-intel" 
    ];
    
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 3;
      efi.canTouchEfiVariables = true;
    };
  };
}
