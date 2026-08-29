{ config, pkgs, inputs, options, ... }:

{
  imports = [ 
    ./niri/binds.nix
    ./niri/input.nix
    ./niri/layout.nix
    ./niri/misc.nix
    ./niri/window-rules.nix 
  ];

  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
    settings = {
      environment = {
        NIRI_USER_TERMINAL = "kitty";
        NIRI_USER_TASKMANAGER = "kitty -e btop";
        NIRI_USER_FILEMANAGER = "kitty -e yazi";
        NIRI_USER_MENU = "fuzzel";
        NIRI_USER_BROWSER = "firefox";
        NIRI_USER_MUSICPLAYER = "elisa";
        NIRI_USER_MUSICSTREAMER = "kitty -e rs-pug";
      };

      spawn-at-startup = [
        { command = [ "${pkgs.dunst}/bin/dunst" ]; }
        { command = [ "${pkgs.quickshell}/bin/quickshell" ]; }
        { command = [ "${pkgs.xwayland-satellite}/bin/xwayland-satellite" ]; }
        { command = [ "${pkgs.dbus}/bin/dbus-update-activation-environment" "--systemd" "WAYLAND_DISPLAY" "XDG_CURRENT_DESKTOP=niri" ]; }
      ];
    };
  };
}
