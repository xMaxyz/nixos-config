{ config, ... }:

{
  services = {
    openssh.enable = true;
    upower.enable = true;
    fstrim.enable = true;
  };
}
