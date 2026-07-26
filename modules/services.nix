{ config, pkgs, ... }:

{
  services = {
    openssh.enable = true;
    upower.enable = true;
    fstrim.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    extraConfig.pipewire = {
      "10-clock-rates" = {
        "context.properties" = {
          "default.clock.allowed-rates" = [ 44100 48000 88200 96000 176400 192000 ]        
        };
      };
    };
  };
}
