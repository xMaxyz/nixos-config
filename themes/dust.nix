{ config, ... }:

{
  my.theme = {
    global = {
      colors = {
        accent = "faa768";
      };
      font = "JetBrainsMono Nerd Font";
    };

    custom = {
      zsh = {
        prompt = "%F{#ff803b}%#%f %F{#faa768}%2~%f %F{#cdd6f4}>%f ";
        rprompt = "";
      };

      fuzzel = {
        background = "000000bb";
        text = "cdd6f4aa";
        prompt = "cdd6f4ff";
        input = "ffffffaa";
        match = "${config.my.theme.global.colors.accent}aa";
        selection = "${config.my.theme.global.colors.accent}33";
        selection-text = "ffffffff";
        selection-match = "${config.my.theme.global.colors.accent}ff";
        border = "${config.my.theme.global.colors.accent}ee";
      };

      dunst = {
        colors = {
          background = "131313e0";
          foreground = "ffffff";
          frame_color = "${config.my.theme.global.colors.accent}";
        };

        urgency_low = {
          background = "2a2a2acc";
          foreground = "cfcfcf";
          frame_color = "666666";
        };

        urgency_normal = {
          background = "1f2b1fcc";
          foreground = "ffffff";
          frame_color = "66bb66";
        };

        urgency_critical = {
          background = "2b1f1fcc";
          foreground = "ffffff";
          frame_color = "cc6666";
        };
      };
    };
  };
}