{ config, pkgs, lib, inputs, ... }:

{
  boot = {
    kernelModules = [ 
      "kvm-intel" 
    ];
    
    loader = {
      systemd-boot.enable = false;
      systemd-boot.configurationLimit = 1;
      efi.canTouchEfiVariables = false;
    };
  };
}
