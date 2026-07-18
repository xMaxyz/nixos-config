{ config, pkgs, ... }:

{
  programs.niri.settings = {
  
    window-rules = [
      {
        matches = [
          { app-id = "^org\\.wezfurlong\\.wezterm$"; }
        ];
        default-column-width = {};
      }

#      {
#        matches = [
#          { app-id = "firefox$"; }
#          { title = "^Picture-in-Picture$"; }
#        ];
#        open-floating = true;
#      }
    ];
  };
}