{ lib, config, ... }:

{
  config.my.host.ui = {
    global = {
      accent = "faa768";
      radius = 10;
      wallpaper = "file:///home/max/Bilder/.wallpaper/dust";
      text = {
        foreground = "ffffff";
        subAlpha = "d0";
        font = "JetBrainsMono Nerd Font";
        size = 11;
      };
    };

    desktop = {
      zsh = {
        prompt = "%F{#ff803b}%#%f %F{#faa768}%2~%f %F{#cdd6f4}>%f ";
        rprompt = "";
      };

      niri = {
        border = {
          inactive-color = [ "#" "595959" "aa" ];
          urgent-color = [ "#" "9b0000" "ff" ];
          active-gradient = [ 
            [ "#" config.my.host.ui.global.accent "ee" ] 
            [ "#" "fdaa6b" "ee" ] 
          ];
        };
      };

      quickshell = {
        menubar = {
          box = {
            radius = config.my.host.ui.global.radius;
            background = [ "#" "b3" "141414" ];
          };
          text.color = config.my.host.ui.global.text.foreground;
        };

        widget = {
          zonewidth = 0.3;
          clock = {
            box.background = [ "#" "25" "000000" ];
            border = {
              color = [ "#" "15" "ffffff" ];
              width = 1;
            };
            text = {
              topColor = [ "#" "ff" config.my.host.ui.global.text.foreground ];
              subColor = [ "#" config.my.host.ui.global.text.subAlpha config.my.host.ui.global.text.foreground ];
            };
          };
        };
      };

      dunst = {
        box = {
          background = [ "#" "131313" "e0" ];
          foreground = [ "#" config.my.host.ui.global.text.foreground "ff" ];
          transparency = 10;
          origin = "top-right";
        };
        border = {
          color = [ "#" config.my.host.ui.global.accent "ff" ];
          width = 2;
          radius = config.my.host.ui.global.radius;
        };
        urgency = {
          normal = {
            background = [ "#" "1f2b1f" "cc" ];
            foreground = [ "#" config.my.host.ui.global.text.foreground "ff" ];
            frame_color = [ "#" "66bb66" "ff" ];
          };
          low = {
            background = [ "#" "2a2a2a" "cc" ];
            foreground = [ "#" "cfcfcf" "ff" ];
            frame_color = [ "#" "66bb66" "ff" ];
          };
          critical = {
            background = [ "#" "2b1f1f" "cc" ];
            foreground = [ "#" config.my.host.ui.global.text.foreground "ff" ];
            frame_color = [ "#" "cc6666" "ff" ];
          };
        };
      };

      fuzzel = {
        box = {
          background = [ "000000" "bb" ];
          border = [ config.my.host.ui.global.accent "ee" ]; 
        };
        search = {
          prompt = [ "cdd6f4" "ff" ];
          input = [ config.my.host.ui.global.text.foreground "aa" ];
        };
        list = {
          selected = {
            background = [ config.my.host.ui.global.accent "33" ];
            text = [ config.my.host.ui.global.text.foreground "ff" ];
            match = [ config.my.host.ui.global.accent "ff" ];
          };
          unselected = {
            text = [ "cdd6f4" config.my.host.ui.global.text.subAlpha ];
            match = [ config.my.host.ui.global.accent "aa" ];
          };
        };
      };
    };

    apps = {
      yazi = {
        mime = {
          image.any = [ "#" "6ae384" ];
          video.any = [ "#" "6ba1c9" ];
          audio.any = [ "#" "ff4949" ];
          inode.empty = "white";
          text.plain = "gray";
          dir = [ "#" config.my.host.ui.global.accent ];
        };
      };
    };
  };
}