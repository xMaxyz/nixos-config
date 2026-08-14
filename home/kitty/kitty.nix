{ lib, config, pkgs, ... }:

{
  programs = {  
    kitty = {
      enable = true;
      package = pkgs.kitty;
      settings = {
        background_opacity = "0.6";
        font_size = config.my.host.ui.apps.kitty.font_size;
        confirm_os_window_close = "0";
        enable_audio_bell = false;
      };
    };
  };
}
