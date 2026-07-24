{ config, pkgs, lib, inputs, ... }:

{
  boot = {
    kernelModules = [ 
      "kvm-intel" 
      "wl" 
    ];
    
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd = {
      availableKernelModules = [ 
        "uhci_hcd" 
        "ehci_pci" 
        "ahci" 
        "firewire_ohci" 
        "usbhid" 
        "usb_storage" 
        "sd_mod" 
        "sdhci_pci" 
      ];

      kernelModules = [ ];
    };
  };
}