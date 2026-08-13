{ config, pkgs, inputs, lib, ... }:

let

  hex = lib.concatStrings;
  qs = config.my.host.ui.desktop.quickshell;
  g = config.my.host.ui.global;

in

{
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

  xdg.configFile."quickshell/qmldir".text = ''
    singleton Theme 1.0 Theme.qml
  '';

  xdg.configFile."quickshell/Theme.qml".text = ''
    pragma Singleton
    import QtQuick

    QtObject {
      property string fontFamily: "${g.text.font}"
      property color accent: "#${g.accent}"
      property string wallpaper: "${g.wallpaper}"
      
      //Menubar-Box
      property color menubarBoxBackground: "${hex qs.menubar.box.background}"
      property int menubarBoxRadius: ${qs.menubar.box.radius}
      property int menubarBoxWidth: ${qs.menubar.box.width}
      property int menubarBoxHeight: ${qs.menubar.box.height}

      //Menubar-Text
      property color menubarTextColor: "${hex qs.menubar.text.color}"
      property int menubarTextSize: ${qs.menubar.text.size}


      //Widget
      property real zoneWidth: ${qs.widget.zonewidth}

      //Widget-Clock-Box
      property color widgetClockBoxBackground: "${hex qs.widget.clock.box.background}"
      property int widgetClockBoxHeight: ${qs.widget.clock.box.height}

      //Widget-Clock-Border
      property color widgetClockBorderColor: "${hex qs.widget.clock.border.color}"
      property int widgetClockBorderWidth: ${qs.widget.clock.border.width}
      property int widgetClockBorderRadius: ${qs.widget.clock.border.radius}

      //Widget-Clock-Text
      property color widgetClockTextTopColor: "${hex qs.widget.clock.text.topColor}"
      property color widgetClockTextSubColor: "${hex qs.widget.clock.text.subColor}"
      property int widgetClockTextTopSize: ${qs.widget.clock.text.topSize}
      property int widgetClockTextSubSize: ${qs.widget.clock.text.subSize}

    }
  '';

  xdg.configFile = {
    "quickshell/modules".source = ../../assets/quickshell/modules;
    "quickshell/menubar".source = ../../assets/quickshell/menubar;
    "quickshell/desktop".source = ../../assets/quickshell/desktop;
  };
  
}
