{ config, ... }:

{
  home-manager.users.max.programs.niri.settings.outputs = {
    "HDMI-A-1" = {
      mode = "1920x1080@60.000";
      position = { x = 1920; y = 0; };
    };
  };
}
