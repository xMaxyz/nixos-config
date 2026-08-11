{ config, ... }:

{
  my.theme = {
    global = {
      colors = {
        accent = "faa768";
        foreground = "ffffff";
      };
      font = "JetBrainsMono Nerd Font";
      wallpaper = "file:///home/max/Bilder/.wallpaper/dust";
    };

    zsh = {
      prompt = "%F{#ff803b}%#%f %F{#faa768}%2~%f %F{#cdd6f4}>%f ";
      rprompt = "";
    };

    fuzzel = {
      background = "000000bb";
      text = "cdd6f4d0"; #zusammenführen! 
      prompt = "cdd6f4ff"; # ^^^^
      input = "${config.my.theme.global.colors.foreground}aa";
      match = "${config.my.theme.global.colors.accent}aa";
      selection = "${config.my.theme.global.colors.accent}33";
      selection-text = "${config.my.theme.global.colors.foreground}ff";
      selection-match = "${config.my.theme.global.colors.accent}ff";
      border = "${config.my.theme.global.colors.accent}ee";
    };

    dunst = {
      colors = {
        background = "131313e0";
        foreground = "${config.my.theme.global.colors.foreground}";
        frame_color = "${config.my.theme.global.colors.accent}";
      };

      urgency_low = {
        background = "2a2a2acc";
        foreground = "cfcfcf";
        frame_color = "666666";
      };

      urgency_normal = {
        background = "1f2b1fcc";
        foreground = "${config.my.theme.global.colors.foreground}";
        frame_color = "66bb66";
      };

      urgency_critical = {
        background = "2b1f1fcc";
        foreground = "${config.my.theme.global.colors.foreground}";
        frame_color = "cc6666";
      };
    };

    niri = { #alles unhashedRgbaType
      border = {
        inactive-color = "595959aa";
        urgent-color = "9b0000ff";
        active-gradient = {
          from = "${config.my.theme.global.colors.accent}ee";
          to = "fdaa6bee";
        };
      };
    };

    quickshell = {
      menubar = {
        background = "b3141414";
      };

      widget = {
        background = "25000000";
        border.color = "15ffffff";
        subtext = "${config.my.theme.quickshell.text.sub.color}";
        zonewidth = "0.3";
      };

      accent = "${config.my.theme.global.colors.accent}";

      text = {
        foreground = "${config.my.theme.global.colors.foreground}";
        family = "${config.my.theme.global.font}";
        color = "${config.my.theme.global.colors.foreground}";
        sub.color = "d0${config.my.theme.global.colors.foreground}"; #d0 durch neuen subAlpha ersetzen!
      };
    };

    yazi = {
      color.mime = {
        image.any = "6ae384";
        video.any = "6ba1c9";
        audio.any = "ff4949";
        inode.empty = "white"; #colorNameType nutzen!
        text.plain = "gray"; #colorNameType nutzen!
        dir = "${config.my.theme.global.colors.accent}";
      };
    };
  };
}
