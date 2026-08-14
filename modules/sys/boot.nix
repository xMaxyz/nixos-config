{ config, pkgs, lib, inputs, ... }:

{
  boot = {
    kernelModules = [ 
      "kvm-intel" 
    ];
    
    loader = {
      systemd-boot.enable = false;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        efiInstallAsRemovable = true;
        useOSProber = true;
      };
      efi.canTouchEfiVariables = false;
    };
  };
}
