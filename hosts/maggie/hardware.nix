{ pkgs, config, inputs, lib, ... }:

{
  imports = [
    ../../modules/hardware/broadcom.nix
  ];

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  hardware.graphics.enable32Bit = true;
  
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/8232ee9b-6e57-421f-83a5-1d465a14eb79";
      fsType = "ext4";
      options = [ "defaults" "noatime" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/64CA-6248";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

}