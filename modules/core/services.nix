{ config, ... }:

{
  networking.networkmanager.enable = true;
  services = {
    openssh.enable = true;
    upower.enable = true;
    fstrim.enable = true;
  };

  systemd.timers."fstrim".timerConfig.Persistent = true;
}
