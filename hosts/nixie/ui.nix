{ lib, config, ... }:

{
  config.my.host.ui = {
    desktop.quickshell = {
      menubar = {
        box = {
          width = 90;
          height = 50;
        };
        text.size = 12;
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

    apps.kitty = {
      font_size = "13.0";
    };
  };
}
