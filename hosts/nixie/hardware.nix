{ pkgs, config, inputs, lib, ... }:

{
  imports = [
    #../../modules/extra/nvidia-pascal.nix
    #../../modules/extra/pipewire.nix
  ];

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  hardware.graphics.enable32Bit = true;
  
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/477bf080-e36f-40e8-95ae-bb44e61d82a3";
      fsType = "ext4";
      options = [ "defaults" "noatime" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/4E7B-A950";
      fsType = "vfat";
      options = [ "fmask=0022" "dmask=0022" ];
    };
  
  boot.initrd = {
    availableKernelModules = [
      "xhci_pci"
      "ahci"
      "nvme"
      "usbhid"
      "uas"
      "usb_storage"
      "sd_mod"
      "sr_mod"
      "rtsx_usb_sdmmc"
    ];
    kernelModules = [];
  };

}
