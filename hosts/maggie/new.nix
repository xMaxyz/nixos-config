{ lib, config, ... }:

{
  config.my.host.ui = {
    desktop.quickshell = {
      menubar = {
        box = {
          width = 70;
          height = 40;
        };
        text.size = config.my.host.ui.global.text.size;
      };

      widget = {
        clock = {
          box.height = 140;
          text = {
            topSize = 34;
            subSize = 13;
          };
        };
      };
    };
  };
}