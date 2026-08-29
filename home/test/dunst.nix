{ config, lib, ... }:

let
  str = lib.toString;
  hex = lib.concatStrings;
  d = config.my.host.ui.desktop.dunst;
  g = config.my.host.ui.global;
in
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "mouse";
        width = "320";
        height = "(0, 120)";
        origin = d.box.origin;
        offset = "(15, 15)";
        corner_radius = str d.border.radius;
        frame_width = str d.border.width; # lib.toString my.host.ui.desktop.dunst.global.frame_width
        gap_size = "8";
        transparency = str d.box.transparency;
        
        font = builtins.concatStringsSep " " [ 
          g.text.font 
          (str g.text.size) 
        ];
        
        background = hex d.box.background;
        foreground = hex d.box.foreground;
        frame_color = hex d.border.color;
        separator_color = "frame";
        padding = "14";
        horizontal_padding = "14";
        sort = true;
        idle_threshold = "120";
        line_height = "2";
        markup = "full";
        format = "<b>%s</b>\n%b";
        alignment = "left";
        show_age_threshold = "60";
        word_wrap = true;
        ignore_newline = false;
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = true;
      };

      urgency_low = {
        timeout = "5";
        background = hex d.urgency.low.background;
        foreground = hex d.urgency.low.foreground;
        frame_color = hex d.urgency.low.frame_color;
      };

      urgency_normal = {
        background = hex d.urgency.normal.background;
        foreground = hex d.urgency.normal.foreground;
        frame_color = hex d.urgency.normal.frame_color;
      };

      urgency_critical = {
        background = hex d.urgency.critical.background;
        foreground = hex d.urgency.critical.foreground;
        frame_color = hex d.urgency.critical.frame_color;
      };
    };
  };
}