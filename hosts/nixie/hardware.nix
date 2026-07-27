{ pkgs, config, inputs, lib, ... }:

{
  imports = [
    ../../modules/extra/nvidia-pascal.nix
    ../../modules/extra/pipewire.nix
  ];

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  hardware.graphics.enable32Bit = true;
  
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/####";
      fsType = "ext4";
      options = [ "defaults" "noatime" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/####";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

}
