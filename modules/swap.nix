{ config, lib, pkgs, ... }:

{
  zramSwap = {
    enable = true;
    algorithm = "lz4";
    memoryPercent = 50;
    priority = 100;
  };
  
  swapDevices = [ 
    {
      device = "/swapfile";
      size = 12 * 1024;
      priority = 1;
    }
  ];

  boot.kernel.sysctl = {
    "vm.swappiness" = 180;
  };
}