{ config, pkgs, ... }:

{
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    
    extraConfig.pipewire = {
      "10-clock-rates" = {
        "context.properties" = {
          "default.clock.allowed-rates" = [ 44100 48000 88200 96000 176400 192000 ];
        };
      };
    };
  };
  environment.systemPackages = with pkgs; [ 
    pavucontrol
    qjackctl #audio routing
    crosspipe #better audio routing
  ];
}
