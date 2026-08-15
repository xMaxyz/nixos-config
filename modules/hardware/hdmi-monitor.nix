{ config, ... }:

{
  home-manager.users.max.programs.niri.settings.outputs = {
    "HDMI-A-1" = {
      mode = {
        width = 1920;
        height = 1080;
        refresh = 60.000;
      };
      position = { x = 1920; y = 0; };
    };
  };
}
