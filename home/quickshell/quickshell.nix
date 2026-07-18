{ config, pkgs, inputs, ... }:

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
      //colors
      property color menubarBackground: "#${config.my.theme.quickshell.menubar.background}" //background for components of menubar
      property color widgetBackground: "#${config.my.theme.quickshell.widget.background}"
      property color widgetBorderColor: "#${config.my.theme.quickshell.widget.border.color}"
      property color accent: "#${config.my.theme.quickshell.accent}"
      property color foreground: "#${config.my.theme.quickshell.text.color}" //text color
      property color widgetSubtext: "#${config.my.theme.quickshell.widget.subtext}"

      //fonts
      readonly property string fontFamily: "${config.my.theme.quickshell.text.family}"
      readonly property int normalFontSize: ${config.my.theme.quickshell.text.size}

      //box style
      readonly property int borderRadius: ${config.my.theme.quickshell.menubar.border.radius} //for all components of menubar but MusicPopup
      readonly property int menubarBoxWidth: ${config.my.theme.quickshell.menubar.boxwidth} //Base value for all components of menubar
      readonly property int menubarBoxHeight: ${config.my.theme.quickshell.menubar.boxheight} //Height for all menubar


      //Widget
      readonly property real widgetzoneWidth: ${config.my.theme.quickshell.widget.zonewidth}
    }
  '';

  xdg.configFile = {
    "quickshell/modules".source = ../../assets/quickshell/modules;
    "quickshell/menubar".source = ../../assets/quickshell/menubar;
    "quickshell/desktop".source = ../../assets/quickshell/desktop;
  };
  
}