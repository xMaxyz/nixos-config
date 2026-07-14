{ config, pkgs, ... }:

{
  programs.niri.settings = {
    layout = {
      gaps = 10;
      background-color = "transparent";
      center-focused-column = "never";
      preset-column-widths = [
        { proportion = 1.0 / 3.0; }
        { proportion = 1.0 / 2.0; }
        { proportion = 2.0 / 3.0; }
      ];
      default-column-width = {};
      focus-ring.enable = false;
      border = {
        enable = true;
        width = 2;
        inactive.color = "#${config.my.theme.custom.niri.border.inactive-color}";
        urgent.color = "#${config.my.theme.custom.niri.border.urgent-color}";
        active.gradient = {
          from = "#${config.my.theme.custom.niri.border.active-gradient.from}";
          to = "#${config.my.theme.custom.niri.border.active-gradient.to}";
          angle = 45;
          relative-to = "workspace-view";
        };
      };

      shadow = {
        enable = true;
        softness = 30;
        spread = 5;
        offset = { x = 0; y = 5; };
        color = "#ee1a1a1a";
      };

      struts = {
        left = 0;
        right = 0;
        top = -2;
        bottom = -2;
      };
    };

    blur = {
      passes = 1;
      offset = 2;
      noise = 0.02;
      saturation = 1;
    };

    window-rules = [
      {
        geometry-corner-radius = {
          top-left = 10.0;
          top-right = 10.0;
          bottom-left = 10.0;
          bottom-right = 10.0;
        };
        clip-to-geometry = true;
      }
      
      {
        background-effect = {
          blur = true;
          xray = false;
        };
      }
    ];

    layer-rules = [
      {
        matches = [ 
          { namespace = "^wallpaper*"; }
        ];
        place-within-backdrop = true;
      }
    ];

    animations.enable = true;   
  };
}