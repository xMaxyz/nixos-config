{ config, pkgs, inputs, ... }:

{
  imports = [
    ./modules/wallpaper.nix
    ./modules/menubar.nix
    ./modules/desktop.nix

    ./desktop/widgets/clock-widget.nix

    ./menubar/clockbox.nix
    ./menubar/musicbox.nix
    ./menubar/musicpopup.nix
    ./menubar/statusbar.nix

  ];
  
  programs.quickshell = {
    enable = true;
    package = pkgs.quickshell;
  };

  xdg.configFile."quickshell/shell.qml".text = ''
    import QtQuick
    import Quickshell
    import "modules" as Module

    ShellRoot {
      Module.Wallpaper {}
      Module.MenuBar {}
      Module.Desktop {}
    }
  '';
}