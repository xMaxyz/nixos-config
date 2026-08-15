{ config, pkgs, ... }:

{
  programs.niri.settings.binds = {
    "Mod+X".action.spawn-sh = [ "$NIRI_USER_TERMINAL" ];
    "Mod+Space".action.spawn-sh = [ "$NIRI_USER_MENU" ];
    "Mod+Shift+Space".action.spawn-sh = [ "fuzzel --launch-prefix nvidia-offload" ];
    "Mod+E".action.spawn-sh = [ "$NIRI_USER_FILEMANAGER" ];
    "Mod+Shift+E".action.spawn-sh = [ "dolphin" ];
    "Mod+B".action.spawn-sh = [ "$NIRI_USER_BROWSER" ];
    "Mod+T".action.spawn-sh = [ "$NIRI_USER_TASKMANAGER" ];
    "Mod+M".action.spawn-sh = [ "$NIRI_USER_MUSICPLAYER" ];
    "Mod+Shift+M".action.spawn-sh = [ "$NIRI_USER_MUSICSTREAMER" ];
    "Mod+A".action.spawn-sh = [ "nwg-drawer" ];
    "Mod+Alt+L".action.spawn = [ "swaylock" ];




    "XF86AudioRaiseVolume" = {
      action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%+" "-l" "1.0" ];
      allow-when-locked = true;
    };
    "XF86AudioLowerVolume" = {
      action.spawn = [ "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-" ];
      allow-when-locked = true;
    };
    "XF86AudioMute" = {
      action.spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle" ];
      allow-when-locked = true;
    };
    "XF86AudioMicMute" = {
      action.spawn = [ "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle" ];
      allow-when-locked = true;
    };
    "XF86AudioPlay" = {
      action.spawn = [ "playerctl" "play-pause" ];
      allow-when-locked = true;
    };
    "XF86AudioStop" = {
      action.spawn = [ "playerctl" "stop" ];
      allow-when-locked = true;
    };
    "XF86AudioPrev" = {
      action.spawn = [ "playerctl" "previous" ];
      allow-when-locked = true;
    };
    "XF86AudioNext" = {
      action.spawn = [ "playerctl" "next" ];
      allow-when-locked = true;
    };
    "XF86MonBrightnessUp" = {
      action.spawn = [ "brightnessctl" "-e4" "-n2" "set" "5%+" ];
      allow-when-locked = true;
    };
    "XF86MonBrightnessDown" = {
      action.spawn = [ "brightnessctl" "-e4" "-n2" "set" "5%-" ];
      allow-when-locked = true;
    };
    "XF86KbdBrightnessUp" = {
      action.spawn = [ "brightnessctl" "--device=smc::kbd_backlight" "s" "10%+" ];
      allow-when-locked = true;
    };
    "XF86KbdBrightnessDown" = {
      action.spawn = [ "brightnessctl" "--device=smc::kbd_backlight" "s" "10%-" ];
      allow-when-locked = true;
    };
    "XF86LaunchA".action.toggle-overview = {};



    "Mod+Y".action.toggle-overview = {};
    "Mod+Q".action.close-window = {};



    "Mod+Left".action.focus-column-left = {};
    "Mod+Odiaeresis".action.focus-column-left = {};
    "Mod+Down".action.focus-window-or-workspace-down = {};
    "Mod+Up".action.focus-window-or-workspace-up = {};
    "Mod+Right".action.focus-column-right = {};
    "Mod+Adiaeresis".action.focus-column-right = {};

    "Mod+H".action.focus-column-left = {};
    "Mod+J".action.focus-window-or-workspace-down = {};
    "Mod+K".action.focus-window-or-workspace-up = {};
    "Mod+L".action.focus-column-right = {};

    "Mod+Shift+Left".action.move-column-left = {};
    "Mod+Shift+Odiaeresis".action.move-column-left = {};
    "Mod+Shift+Down".action.move-column-to-workspace-down = {};
    "Mod+Shift+Up".action.move-column-to-workspace-up = {};
    "Mod+Shift+Right".action.move-column-right = {};
    "Mod+Shift+Adiaeresis".action.move-column-right = {};

    "Mod+Shift+H".action.move-column-left = {};
    "Mod+Shift+J".action.move-column-to-workspace-down = {};
    "Mod+Shift+K".action.move-column-to-workspace-up = {};
    "Mod+Shift+L".action.move-column-right = {};

    "Mod+SSharp".action.focus-column-first = {};
    "Mod+Dead_Acute".action.focus-column-last = {};
    "Mod+Shift+SSharp".action.move-column-to-first = {};
    "Mod+Shift+Dead_Acute".action.move-column-to-last = {};

    "Mod+P".action.move-window-up = {};
    "Mod+Udiaeresis".action.move-window-down = {};
    "Mod+Shift+P".action.move-window-to-workspace-up = {};
    "Mod+Shift+Udiaeresis".action.move-window-to-workspace-down = {};

    "Mod+Numbersign".action.focus-workspace-down = {};
    "Mod+Plus".action.focus-workspace-up = {};
    "Mod+Shift+Numbersign".action.move-workspace-down = {};
    "Mod+Shift+Plus".action.move-workspace-up = {};

    "Mod+Alt+Left".action.focus-monitor-left = {};
    "Mod+Alt+Down".action.focus-monitor-down = {};
    "Mod+Alt+Up".action.focus-monitor-up = {};
    "Mod+Alt+Right".action.focus-monitor-right = {};

    "Mod+Shift+Alt+Left".action.move-column-to-monitor-left = {};
    "Mod+Shift+Alt+Down".action.move-column-to-monitor-down = {};
    "Mod+Shift+Alt+Up".action.move-column-to-monitor-up = {};
    "Mod+Shift+Alt+Right".action.move-column-to-monitor-right = {};

    "Mod+Shift+Alt+Odiaeresis".action.move-window-to-monitor-left = {};
    "Mod+Shift+Alt+Adiaeresis".action.move-window-to-monitor-right = {};
    "Mod+Shift+Alt+P".action.move-window-to-monitor-up = {};
    "Mod+Shift+Alt+Udiaeresis".action.move-window-to-monitor-down = {};

    #"Mod+Shift+Alt+Plus".action.move-workspace-to-monitor-top = {};
    #"Mod+Shift+Alt+Numbersign".action.move-workspace-to-monitor-bottom = {};
    #"Mod+Ctrl+Alt+Plus".action.move-workspace-to-monitor-left = {};
    #"Mod+Ctrl+Alt+Numbersign".action.move-workspace-to-monitor-right = {};




    "Mod+Comma".action.consume-or-expel-window-left = {};
    "Mod+Period".action.consume-or-expel-window-right = {};
    "Mod+Shift+Comma".action.consume-window-into-column = {};
    "Mod+Shift+Period".action.expel-window-from-column = {};

    "Mod+Minus".action.set-window-height = "+5%";
    "Mod+Shift+Minus".action.set-window-height = "-5%";
    "Mod+R".action.switch-preset-column-width = {};
    "Mod+Shift+R".action.switch-preset-column-width-back = {};

    "Mod+F".action.maximize-column = {};
    "Mod+Shift+F".action.fullscreen-window = {};
    "Mod+Alt+M".action.maximize-window-to-edges = {};

    "Mod+V".action.toggle-window-floating = {};
    "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = {};

    "Mod+W".action.toggle-column-tabbed-display = {};

    "Mod+S".action.screenshot = {};
    "Mod+Shift+S".action.screenshot-screen = {};
    "Mod+Alt+S".action.screenshot-window = {};

    "Mod+Ctrl+E".action.quit = {};
  };
}
