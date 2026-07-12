{ config, pkgs, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "mouse";
        width = "320";
        height = "(0, 120)";
        origin = "top-right";
        offset = "(15, 15)";
        corner_radius = "12";
        frame_width = "2";
        gap_size = "8";
        transparency = "10";
        font = "${config.my.theme.global.font} 11";
        background = "#${config.my.theme.custom.dunst.colors.background}";
        foreground = "#${config.my.theme.custom.dunst.colors.foreground}";
        frame_color = "#${config.my.theme.custom.dunst.colors.frame_color}";
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
        background = "#${config.my.theme.custom.dunst.urgency_low.background}";
        foreground = "#${config.my.theme.custom.dunst.urgency_low.foreground}";
        frame_color = "#${config.my.theme.custom.dunst.urgency_low.frame_color}";
      };

      urgency_normal = {
        background = "#${config.my.theme.custom.dunst.urgency_normal.background}";
        foreground = "#${config.my.theme.custom.dunst.urgency_normal.foreground}";
        frame_color = "#${config.my.theme.custom.dunst.urgency_normal.frame_color}";
      };

      urgency_critical = {
        background = "#${config.my.theme.custom.dunst.urgency_critical.background}";
        foreground = "#${config.my.theme.custom.dunst.urgency_critical.foreground}";
        frame_color = "#${config.my.theme.custom.dunst.urgency_critical.frame_color}";
      };
    };
  };
}