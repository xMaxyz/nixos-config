{ lib, config, ... }:

{
  config.my.host.ui = {
    desktop.quickshell = {
      menubar = {
        box = {
          width = 70;
          height = 40;
        };
        text.size = 10;
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

  apps.kitty = {
    font_size = "11.0";
  };
}
